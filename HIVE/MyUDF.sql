-- zastepowanie znaku w stringu 
regexp_replace UDF performs my task. Below is the definition and usage from apache Wiki.

regexp_replace(string INITIAL_STRING, string PATTERN, string REPLACEMENT):

<dragon-ball-z> <dragon-ball-series> <dragon-ball-gt>

    String[] result = "this is a test".split("\\s");
     for (int x=0; x<result.length; x++)
         System.out.println(result[x]);



import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;
 


public class WordSplit extends UDF {

  public ArrayList<String> evaluate(final Text text) {
    ArrayList<String> splitList = new ArrayList<String>();

    StringTokenizer tokenizer = new StringTokenizer(text.toString());

    while (tokenizer.hasMoreElements()) {
      String word = stemWord((String) tokenizer.nextElement());
      splitList.add(word);
    }
    return splitList;
  }

  /**
   * Stems words to normal form.
   *
   * @param word
   * @return Stemmed word.
   */
  private String stemWord(String word) {
    word = word.toLowerCase();
    return word;
  }
}