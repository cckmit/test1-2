package chn.bhmc.dms.bat.httpUtils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.net.util.Base64;
import org.json.simple.JSONObject;

/**
 * HMAC-MD5算法

HMAC（K，M）=H（K⊕opad∣H（K⊕ipad∣M））

其中:K是密钥（OperatorSecret），长度可为64字节，若小于该长度，在密钥后面用“0”补齐。

     M是消息内容；

     H是散列函数；

     opad和Ipad分别是由若干个0x5c和0x36组成的字符串；

     ⊕表示异或运算；

     ∣表示连接操作。

（2）HMAC-MD5流程

	1)	在签名密钥（SigSecret）后面添加0来创建一个长为64字节的字符串(str)；
	
	2)	将上一步生成的字符串(str)与ipad(0x36)做异或运算，形成结果字符串(istr)；
	
	3)将消息内容data附加到第二步的结果字符串(istr)的末尾；
	
	4)做md5运算于第三步生成的数据流(istr)；
	
	5)	将第一步生成的字符串(str)与opad(0x5c)做异或运算，形成结果字符串(ostr)；
	
	6)再将第四步的结果(istr)附加到第五步的结果字符串(ostr)的末尾；
	
	7)做md5运算于第六步生成的数据流(ostr)，输出最终结果(out)。
 * /
/**
* @Title: HMacMD5Util
* @Description: HMacMD5 数据签名
* @author chy
* @date 2018/6/11 15:32
*/
public class HMacMD5Util {

    /**
     * 计算参数的md5信息
     *
     * @param str 待处理的字节数组
     * @return md5摘要信息
     * @throws NoSuchAlgorithmException
     */
    private static byte[] md5(byte[] str) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(str);
        return md.digest();
    }

    /**
     * 将待加密数据data，通过密钥key，使用hmac-md5算法进行加密，然后返回加密结果。 参照rfc2104 HMAC算法介绍实现。
     * @param key  密钥
     * @param data 待加密数据
     * @return 加密结果
     * @throws NoSuchAlgorithmException
     */
    public static byte[] getHmacMd5Bytes(byte[] key, byte[] data) throws NoSuchAlgorithmException {
        /*
         * HmacMd5 calculation formula: H(K XOR opad, H(K XOR ipad, text))
         * HmacMd5 计算公式：H(K XOR opad, H(K XOR ipad, text))
         * H代表hash算法，本类中使用MD5算法，K代表密钥，text代表要加密的数据 ipad为0x36，opad为0x5C。
         */
        int length = 64;
        byte[] ipad = new byte[length];
        byte[] opad = new byte[length];
        for (int i = 0; i < 64; i++) {
            ipad[i] = 0x36;
            opad[i] = 0x5C;
        }
        byte[] actualKey = key; // Actual key.
        byte[] keyArr = new byte[length]; // Key bytes of 64 bytes length
        /*
         * If key's length is longer than 64,then use hash to digest it and use
         * the result as actual key. 如果密钥长度，大于64字节，就使用哈希算法，计算其摘要，作为真正的密钥。
         */
        if (key.length > length) {
            actualKey = md5(key);
        }
        for (int i = 0; i < actualKey.length; i++) {
            keyArr[i] = actualKey[i];
        }

        /*
         * append zeros to K 如果密钥长度不足64字节，就使用0x00补齐到64字节。
         */
        if (actualKey.length < length) {
            for (int i = actualKey.length; i < keyArr.length; i++)
                keyArr[i] = 0x00;
        }

        /*
         * calc K XOR ipad 使用密钥和ipad进行异或运算。
         */
        byte[] kIpadXorResult = new byte[length];
        for (int i = 0; i < length; i++) {
            kIpadXorResult[i] = (byte) (keyArr[i] ^ ipad[i]);
        }

        /*
         * append "text" to the end of "K XOR ipad" 将待加密数据追加到K XOR ipad计算结果后面。
         */
        byte[] firstAppendResult = new byte[kIpadXorResult.length + data.length];
        for (int i = 0; i < kIpadXorResult.length; i++) {
            firstAppendResult[i] = kIpadXorResult[i];
        }
        for (int i = 0; i < data.length; i++) {
            firstAppendResult[i + keyArr.length] = data[i];
        }

        /*
         * calc H(K XOR ipad, text) 使用哈希算法计算上面结果的摘要。
         */
        byte[] firstHashResult = md5(firstAppendResult);

        /*
         * calc K XOR opad 使用密钥和opad进行异或运算。
         */
        byte[] kOpadXorResult = new byte[length];
        for (int i = 0; i < length; i++) {
            kOpadXorResult[i] = (byte) (keyArr[i] ^ opad[i]);
        }

        /*
         * append "H(K XOR ipad, text)" to the end of "K XOR opad" 将H(K XOR
         * ipad, text)结果追加到K XOR opad结果后面
         */
        byte[] secondAppendResult = new byte[kOpadXorResult.length + firstHashResult.length];
        for (int i = 0; i < kOpadXorResult.length; i++) {
            secondAppendResult[i] = kOpadXorResult[i];
        }
        for (int i = 0; i < firstHashResult.length; i++) {
            secondAppendResult[i + keyArr.length] = firstHashResult[i];
        }

        /*
         * H(K XOR opad, H(K XOR ipad, text)) 对上面的数据进行哈希运算。
         */
        byte[] hmacMd5Bytes = md5(secondAppendResult);

        return hmacMd5Bytes;

    }

    /**
     * 字节转16进制
     * @param src
     * @return
     */
    public static String bytesToHexString(byte[] src){
        StringBuilder stringBuilder = new StringBuilder("");
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++) {
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();
    }

    public static void main(String[] args) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        String key="1234567890abcdef";
        String src="123456789UKS9utFtQBnZBVngFsNnQGm5GrUHd90s+sasqjGi35BETdGeZDrKs0GFOgG637Qf80FtBYhPBTTLHuPobL3kKq+yNwPZx3Zy9Q5Nnx1c3kvvvzE1WpjqvUulskgOhN86oMHKvL1uECkr17Fx5mQ319BbNqJhxUeva0NHfdsgLO/W0QkLj6tCY3F15VhodLIIsGAWM698nddBeZ3jIRDF9WkXAT9I6VGg8jH6gCY1TWrLdoxK0/BqVv78QBNG83Y5HhHCHoDeUGsquYryJoyJqiUJA93X3mI24Tdogu6fu6lBCsycRPqqSk1XDpl+jXhniHbaH/bBQvFD837XLHFkxZ4mpGr4M3HuR3vbu8vyyEhe6hlndumx8GEs7dKU7g28f5VBRT0wTXqHI3uky0IUNhDY0DcbZ7XHlvublPyG8umzUzU8tb6k7Jg5W2pLgkOxcmC/QTcQSNuRP404Yw1wLw==201904151212120001";
//        String src="123456789UKS9utFtQBnZBVngFsNnQGm5GrUHd90s+sasqjGi35BETdGeZDrKs0GFOgG637Qf80FtBYhPBTTLHuPobL3kKq+yNwPZx3Zy9Q5Nnx1c3kvvvzE1WpjqvUulskgOhN86oMHKvL1uECkr17Fx5mQ319BbNqJhxUeva0NHfdsgLO/W0QkLj6tCY3F15VhodLIIU5WTVp+mBAlbw32eWKvrpv8iJ2B1OLa+bjjyYQilafetBONqtPx7VC3fMvvDpSSx5j2c/JF2PVseJoLVPSsVi15KhlKMAZMhppuwcOXEarDDukS2d8bMXi1rTtdLI0FqYeBUuvhr8CDftrgxh199I88TCC5LNwPJy8hjMNHUZmpnUFGvgFOAXTgKBGF3SJmddazkmvIR6mLA38UDnU1wuw==201904151212120001";
        byte[] macmd5 = HMacMD5Util.getHmacMd5Bytes(key.getBytes(), src.getBytes());
        System.out.println(HMacMD5Util.bytesToHexString(macmd5).toUpperCase());
    }
}