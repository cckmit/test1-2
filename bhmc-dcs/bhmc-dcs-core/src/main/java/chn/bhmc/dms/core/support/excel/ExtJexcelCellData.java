package chn.bhmc.dms.core.support.excel;

import java.util.Calendar;
import java.util.Date;

import org.jxls.common.CellRef;
import org.jxls.common.Context;
import org.jxls.transform.jexcel.JexcelCellData;
import org.jxls.transform.jexcel.JexcelUtil;
import org.jxls.transform.jexcel.WritableCellValue;
import org.jxls.util.Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import jxl.BooleanCell;
import jxl.Cell;
import jxl.CellFeatures;
import jxl.DateCell;
import jxl.ErrorCell;
import jxl.FormulaCell;
import jxl.LabelCell;
import jxl.NumberCell;
import jxl.biff.formula.FormulaException;
import jxl.format.CellFormat;
import jxl.write.Blank;
import jxl.write.Boolean;
import jxl.write.DateTime;
import jxl.write.Formula;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableCell;
import jxl.write.WritableCellFeatures;
import jxl.write.WritableSheet;
import jxl.write.WriteException;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ExtJexcelCellData.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kang Seok Han
 * @since 2017. 5. 27.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2017. 5. 27.     Kang Seok Han     최초 생성
 * </pre>
 */

public class ExtJexcelCellData extends JexcelCellData {

    static Logger logger = LoggerFactory.getLogger(ExtJexcelCellData.class);

    jxl.CellType jxlCellType;
    CellFormat cellFormat;
    CellFeatures cellFeatures;

    public ExtJexcelCellData(CellRef cellRef) {
        super(cellRef);
    }

    public static ExtJexcelCellData createCellData(CellRef cellRef, Cell cell){
        ExtJexcelCellData cellData = new ExtJexcelCellData(cellRef);
        cellData.readCell(cell);
        cellData.updateFormulaValue();
        return cellData;
    }

    public CellFormat getCellFormat() {
        return cellFormat;
    }

    private void readCell(Cell cell) {
        readCellGeneralInfo(cell);
        readCellContents(cell);
        readCellStyle(cell);
    }

    private void readCellGeneralInfo(Cell cell) {
        cellFeatures = cell.getCellFeatures();
        if( cellFeatures != null ){
            String comment = cellFeatures.getComment();
            if(comment != null){
                setCellComment(comment);
            }
        }
    }

    private void readCellContents(Cell cell) {
        jxlCellType = cell.getType();
        try {
            if (jxlCellType == jxl.CellType.LABEL){
                LabelCell labelCell = (LabelCell) cell;
                cellValue = labelCell.getString();
                cellType = CellType.STRING;
            }else if (jxlCellType == jxl.CellType.NUMBER){
                NumberCell numberCell = (NumberCell) cell;
                cellValue = numberCell.getValue();
                cellType = CellType.NUMBER;
            }else if (jxlCellType == jxl.CellType.DATE){
                DateCell dateCell = (DateCell) cell;
                cellValue = dateCell.getDate();
                cellType = CellType.DATE;
            }else if (jxlCellType == jxl.CellType.BOOLEAN){
                BooleanCell booleanCell = (BooleanCell) cell;
                cellValue = booleanCell.getValue();
                cellType = CellType.BOOLEAN;
            }else if (jxlCellType == jxl.CellType.STRING_FORMULA || jxlCellType == jxl.CellType.BOOLEAN_FORMULA ||
                    jxlCellType == jxl.CellType.DATE_FORMULA || jxlCellType == jxl.CellType.NUMBER_FORMULA ||
                    jxlCellType == jxl.CellType.FORMULA_ERROR){
                FormulaCell formulaCell = (FormulaCell) cell;
                formula = formulaCell.getFormula();
                cellValue = formula;
                cellType = CellType.FORMULA;
            }else if(jxlCellType == jxl.CellType.ERROR && cell instanceof Formula){
                Formula formulaCell = (Formula) cell;
                formula = formulaCell.getContents();
                cellValue = formula;
                cellType = CellType.FORMULA;
            }else if (jxlCellType == jxl.CellType.ERROR){
                ErrorCell errorCell = (ErrorCell) cell;
                cellValue = errorCell.getErrorCode();
                cellType = CellType.ERROR;
            }else if ( jxlCellType == jxl.CellType.EMPTY ){
                cellValue = null;
                cellType = CellType.BLANK;
            }
            evaluationResult = cellValue;
        } catch (FormulaException e) {
            logger.warn("Failed to read formula", e);
        }
    }

    private void readCellStyle(Cell cell) {
        cellFormat = cell.getCellFormat();
    }

    public void writeToCell(WritableSheet sheet, int col, int row, Context context) throws WriteException {
        evaluate(context);
        if( evaluationResult != null && evaluationResult instanceof WritableCellValue){
            WritableCell cell = ((WritableCellValue)evaluationResult).writeToCell(sheet, col, row, context);
            updateCellStyle(cell);
        }else{
            WritableCell writableCell = createWritableCell(col, row);
            updateCellGeneralInfo(writableCell);
            updateCellStyle( writableCell );
            sheet.addCell(writableCell);
        }

    }

    private WritableCell createWritableCell(int col, int row) {
        WritableCell writableCell = null;
        switch(targetCellType){
            case STRING:
                if( !(evaluationResult instanceof byte[])){
                    writableCell = new Label(col, row, (String) evaluationResult);
                }
                break;
            case BOOLEAN:
                writableCell = new Boolean(col, row, (java.lang.Boolean)evaluationResult );
                break;
            case NUMBER:
                double value = ((java.lang.Number)evaluationResult).doubleValue();
                writableCell = new Number(col, row, value);
                break;
            case FORMULA:
                if( Util.formulaContainsJointedCellRef((String) evaluationResult) ){
                    writableCell = new Label(col, row, (String) evaluationResult);
                }else{
                    writableCell = new Formula(col, row, (String) evaluationResult);
                }
                break;
            case ERROR:
                writableCell = new Blank(col, row);
                break;
            case DATE:
                //writableCell = new DateTime(col, row, (Date)evaluationResult);

                ExtJexcelTransformer transformer = (ExtJexcelTransformer)this.getTransformer();
                Calendar calendar = Calendar.getInstance();
                calendar.setTime((Date)evaluationResult);

                calendar.add(Calendar.MINUTE, transformer.getTimeZone().getRawOffset()/60000);
                writableCell = new DateTime(col, row, calendar.getTime());

                break;
            default:
                writableCell = new Blank(col, row);
                break;
        }
        return writableCell;
    }

    private void updateCellGeneralInfo(WritableCell cell) {
        if( cellFeatures != null ){
            WritableCellFeatures writableCellFeatures = new WritableCellFeatures(cellFeatures);
            if( JexcelUtil.isJxComment(getCellComment()) ){
                writableCellFeatures.removeComment();
            }
            cell.setCellFeatures(writableCellFeatures);
        }
    }

    private void updateCellStyle(WritableCell cell) {
//        WritableCellFormat writableCellFormat = new WritableCellFormat(cellFormat);
//        cell.setCellFormat(writableCellFormat);
        cell.setCellFormat(cellFormat);
    }
}
