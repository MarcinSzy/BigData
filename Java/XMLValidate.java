package it.itfuture.Hive;


import java.util.StringTokenizer;
import java.util.ArrayList;

import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;


public class XMLValidate extends UDF {

    public   String   evaluate(final String XMLtext, final String  XMLprop ) {

        ArrayList<String> splitList = new ArrayList<String>();
        int ifExist;
        int ifFirstTime = 1;
        String XMLcontetnt  = XMLtext.toString();
        String parameters = XMLprop.toString();
        String newXMLcontetnt = new String() ;
        String returnXMLcontetnt = new String();

        StringTokenizer tokenizer = new StringTokenizer(parameters, "@");

        while (tokenizer.hasMoreElements()) {



            String nextElement = (String) tokenizer.nextElement();
            ifExist = XMLcontetnt.indexOf(nextElement+"=");



            if  (ifExist == -1)
            {
                if (ifFirstTime==1)
                {
                    ifFirstTime = 0;
                    newXMLcontetnt =   XMLcontetnt.replaceFirst("/>","");
                }

                newXMLcontetnt = newXMLcontetnt + (nextElement + "=\"-10101\" ");
            }

        }

        if (ifFirstTime==0){
            newXMLcontetnt = newXMLcontetnt +  "/>";
        }

        if (ifFirstTime==0)
        {
            returnXMLcontetnt = newXMLcontetnt;
        }
        else
        {
            returnXMLcontetnt = XMLcontetnt;
        }

        return returnXMLcontetnt;
    }


    private String stemWord(String word) {
        word = word.toLowerCase();
        return word;
    }


}

