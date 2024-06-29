as

 1: // c#at.cs
 2:
 3: using System;
 4: using System.IO;
 5: using System.Text;
 6:
 7: public class CatSample {
 8:   public static void Main(string[] args) {
 9:
10:     string line;
11:
12:     foreach (string arg in args) {
13:       FileStream   fs = new FileStream(arg, FileMode.Open);
14:       StreamReader sr = new StreamReader(fs, Encoding.GetEncoding(932));
15:
16:       while ((line = sr.ReadLine()) != null) {
17:         Console.WriteLine(line);
18:       }
19:       sr.Close();
20:       fs.Close();
21:     }
22:   }
23: }    

  
