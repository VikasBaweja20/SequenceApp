using System;
using System.Collections.Generic;
using System.Linq;

namespace appLibrary
{
    public class LongestIncreasingSubsequence
    {
         public string Get(string userInput){
          
          var elements = userInput.Split(' ');
          var sequence = new int [elements.Length];
          var sequenceList = new List<int[]>();

                for (int i = 0; i < elements.Length; i++)
                {
                    sequence[i] = int.Parse(elements[i]);
                }

            var newSeq= new int[sequence.Length];
            var newSeqCounter=0;
            for (int i = 1; i < sequence.Length; i++) {

            if (i < sequence.Length && sequence[i-1] < sequence[i])
               {
                   newSeq[newSeqCounter] = sequence[i-1];
                   newSeqCounter++;
               }

            else {
                    newSeq[newSeqCounter] = sequence[i-1];
                    Array.Resize(ref newSeq,newSeqCounter + 1);
                    sequenceList.Add(newSeq);
                    newSeq= new int[sequence.Length - i];
                    newSeqCounter=0;
               }

               if (i == sequence.Length-1){
                    newSeq[newSeqCounter] = sequence[i];
                    sequenceList.Add(newSeq);
               }
               
           }

            int maxLength = sequenceList.Max(i=> i == null ? 0 : i.Length);
            return string.Join(" " ,sequenceList.Where(str => str.Length == maxLength).FirstOrDefault());
        }
    }
}
