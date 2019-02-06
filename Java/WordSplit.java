package it.itfuture.Hive;



import java.util.StringTokenizer;
import java.util.ArrayList;


import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;



public class WordSplit extends UDF  {

    public   ArrayList<String>   evaluate(final Text text) {
        ArrayList<String> splitList = new ArrayList<String>();
        String orginalString = text.toString();
        String cleanString = orginalString.replace("<", " ").replace(">","");
        StringTokenizer tokenizer = new StringTokenizer(cleanString);

        while (tokenizer.hasMoreElements()) {
            String word = smallWord((String) tokenizer.nextElement());
            splitList.add(word);
        }
        return splitList;
    }


    private String smallWord (String word) {
        word = word.toLowerCase();
        return word;
    }
}