using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace HR_System.Models
{

    public class DataEncryptor
    {
        TripleDESCryptoServiceProvider symm;

        #region Factory
        public DataEncryptor()
        {
            this.symm = new TripleDESCryptoServiceProvider();
            this.symm.Padding = PaddingMode.PKCS7;
        }
        public DataEncryptor(TripleDESCryptoServiceProvider keys)
        {
            this.symm = keys;
        }

        public DataEncryptor(byte[] key, byte[] iv)
        {
            this.symm = new TripleDESCryptoServiceProvider();
            this.symm.Padding = PaddingMode.PKCS7;
            this.symm.Key = key;
            this.symm.IV = iv;
        }

        #endregion

        #region Properties
        public TripleDESCryptoServiceProvider Algorithm
        {
            get { return symm; }
            set { symm = value; }
        }
        public byte[] Key
        {
            get { return symm.Key; }
            set { symm.Key = value; }
        }
        public byte[] IV
        {
            get { return symm.IV; }
            set { symm.IV = value; }
        }

        #endregion

        #region Crypto

        public byte[] Encrypt(byte[] data) { return Encrypt(data, data.Length); }
        public byte[] Encrypt(byte[] data, int length)
        {
            try
            {
                // Create a MemoryStream.
                var ms = new MemoryStream();

                // Create a CryptoStream using the MemoryStream 
                // and the passed key and initialization vector (IV).
                var cs = new CryptoStream(ms,
                    symm.CreateEncryptor(symm.Key, symm.IV),
                    CryptoStreamMode.Write);

                // Write the byte array to the crypto stream and flush it.
                cs.Write(data, 0, length);
                cs.FlushFinalBlock();

                // Get an array of bytes from the 
                // MemoryStream that holds the 
                // encrypted data.
                byte[] ret = ms.ToArray();

                // Close the streams.
                cs.Close();
                ms.Close();

                // Return the encrypted buffer.
                return ret;
            }
            catch (CryptographicException ex)
            {
                Console.WriteLine("A cryptographic error occured: {0}", ex.Message);
            }
            return null;
        }

        public string EncryptString(string text)
        {
            return Convert.ToBase64String(Encrypt(Encoding.UTF8.GetBytes(text)));
        }

        public byte[] Decrypt(byte[] data) { return Decrypt(data, data.Length); }
        public byte[] Decrypt(byte[] data, int length)
        {
            try
            {
                // Create a new MemoryStream using the passed 
                // array of encrypted data.
                MemoryStream ms = new MemoryStream(data);

                // Create a CryptoStream using the MemoryStream 
                // and the passed key and initialization vector (IV).
                CryptoStream cs = new CryptoStream(ms,
                    symm.CreateDecryptor(symm.Key, symm.IV),
                    CryptoStreamMode.Read);

                // Create buffer to hold the decrypted data.
                byte[] result = new byte[length];

                // Read the decrypted data out of the crypto stream
                // and place it into the temporary buffer.
                cs.Read(result, 0, result.Length);
                return result;
            }
            catch (CryptographicException ex)
            {
                Console.WriteLine("A cryptographic error occured: {0}", ex.Message);
            }
            return null;
        }

        public string DecryptString(string data)
        {
            byte[] arr = Convert.FromBase64String(data);
            return Encoding.UTF8.GetString(Decrypt(arr)).TrimEnd('\0');
        }

        #endregion

    }

    public class DataEncryptorNew
    {
        // This constant string is used as a "salt" value for the PasswordDeriveBytes function calls.
        // This size of the IV (in bytes) must = (keysize / 8).  Default keysize is 256, so the IV must be
        // 32 bytes long.  Using a 16 character string here gives us 32 bytes when converted to a byte array.
        private const string initVector = "tu89geji340t89u2";

        // This constant is used to determine the keysize of the encryption algorithm.
        private const int keysize = 256;

        const string passPhrase = "12312";

        public static string EncryptString(string plainText)
        {
            byte[] initVectorBytes = Encoding.UTF8.GetBytes(initVector);
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);
            PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, null);
            byte[] keyBytes = password.GetBytes(keysize / 8);
            RijndaelManaged symmetricKey = new RijndaelManaged();
            symmetricKey.Mode = CipherMode.CBC;
            ICryptoTransform encryptor = symmetricKey.CreateEncryptor(keyBytes, initVectorBytes);
            MemoryStream memoryStream = new MemoryStream();
            CryptoStream cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write);
            cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);
            cryptoStream.FlushFinalBlock();
            byte[] cipherTextBytes = memoryStream.ToArray();
            memoryStream.Close();
            cryptoStream.Close();
            return Convert.ToBase64String(cipherTextBytes);
        }

        public static string DecryptString(string cipherText)
        {
            byte[] initVectorBytes = Encoding.ASCII.GetBytes(initVector);
            byte[] cipherTextBytes = Convert.FromBase64String(cipherText);
            PasswordDeriveBytes password = new PasswordDeriveBytes(passPhrase, null);
            byte[] keyBytes = password.GetBytes(keysize / 8);
            RijndaelManaged symmetricKey = new RijndaelManaged();
            symmetricKey.Mode = CipherMode.CBC;
            ICryptoTransform decryptor = symmetricKey.CreateDecryptor(keyBytes, initVectorBytes);
            MemoryStream memoryStream = new MemoryStream(cipherTextBytes);
            CryptoStream cryptoStream = new CryptoStream(memoryStream, decryptor, CryptoStreamMode.Read);
            byte[] plainTextBytes = new byte[cipherTextBytes.Length];
            int decryptedByteCount = cryptoStream.Read(plainTextBytes, 0, plainTextBytes.Length);
            memoryStream.Close();
            cryptoStream.Close();
            return Encoding.UTF8.GetString(plainTextBytes, 0, decryptedByteCount);
        }
    }

}