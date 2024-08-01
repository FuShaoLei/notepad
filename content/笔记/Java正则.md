## 简单示例

```java
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {


    static String reg = ".even"; // 匹配任何一个 [X]even 的字符 (包括空字符)
    public static void main(String[] args) {

        List<String> dataList  = Arrays.asList("Seven","even","Maven","eleven","aaren","ueven","谁even"," even");
        Pattern pattern = Pattern.compile(reg);

        for (String item : dataList) {
            Matcher matcher = pattern.matcher(item);

            if (matcher.matches()) {
                System.err.printf("%s  --> matches %n", item);
            } else {
                System.err.printf("%s  --> NOT matches ! %n", item);
            }

        }


    }
}
```

输出：

```
Seven  --> matches 
even  --> NOT matches ! 
Maven  --> NOT matches ! 
eleven  --> NOT matches ! 
aaren  --> NOT matches ! 
ueven  --> matches 
谁even  --> matches
  even  --> matches
```





## 表达式规则


| 正则表达式 |                             含义                             |
| :--------: | :----------------------------------------------------------: |
|    `.`     |                      匹配任何单个字符。                      |
|    `?`     |               一次匹配或根本不匹配前面的元素。               |
|    `+`     |                 与前面的元素匹配一次或多次。                 |
|    `*`     |                 与前面的元素匹配零次或多次。                 |
|    `^`     | 在正则表达式的开头表示字符串的开始。<br />在字符类中表示字符类的取反。 |
|    `$`     |                   匹配字符串中的结束位置。                   |
|    `|`     |                         备用运算符。                         |
|  `[abc]`   |                      匹配 a 或 b 或 c。                      |
|  `[a-c]`   |                   范围; 匹配 a 或 b 或 c。                   |
|  `[^abc]`  |          否定，匹配除 a 或 b 或 c 之外的所有内容。           |
|    `\s`    |                        匹配空白字符。                        |
|    `\w`    |             匹配单词字符； 等同于`[a-zA-Z_0-9]`              |



这里`^`比较特殊

- 在正则表达式的开头表示字符串的开始。
- 在字符类中表示字符类的取反。

比如下面这个正则：

```java
static String reg = "^http[^\\s]*\\.com$"; // 匹配 以 http开头，中间是非空字符的，以.com结尾的字符串
    public static void main(String[] args) {

        List<String> dataList  = Arrays.asList("https://www.example.com","even","Maven","eleven","aaren","https://example.com");
        Pattern pattern = Pattern.compile(reg);

        for (String item : dataList) {
            Matcher matcher = pattern.matcher(item);

            if (matcher.matches()) {
                System.err.printf("%s  --> matches %n", item);
            } else {
                System.err.printf("%s  --> NOT matches ! %n", item);
            }

        }

    }
```

输出：

```
https://www.example.com  --> matches 
even  --> NOT matches ! 
Maven  --> NOT matches ! 
eleven  --> NOT matches ! 
aaren  --> NOT matches ! 
https://example.com  --> matches
```







## matches 和 find 有何区别

- matches：用于检查整个字符串是否与正则匹配
- find：是否有部分匹配

