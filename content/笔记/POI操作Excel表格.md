pom.xml

```xml
    <dependencies>
        <!-- https://mvnrepository.com/artifact/net.sourceforge.jexcelapi/jxl -->
        <dependency>
            <groupId>org.apache.poi</groupId>
            <artifactId>poi-ooxml</artifactId>
            <version>4.1.2</version>
        </dependency>

        <dependency>
            <groupId>org.apache.poi</groupId>
            <artifactId>poi-ooxml-schemas</artifactId>
            <version>4.1.2</version>
        </dependency>

        <dependency>
            <groupId>org.apache.poi</groupId>
            <artifactId>poi</artifactId>
            <version>4.1.2</version>
        </dependency>


    </dependencies>
```



```java

public class Main {


    private static String URL_PRE = "D:\\code\\bro-excel\\file\\";
    private static String FILE_NAME = "table_catalog_origin.xlsx";

    private static final String XLS = "xls";
    private static final String XLSX = "xlsx";

    private final static int BEGIN_INDEX = 2; // row 和 column 的序号都是从 0 开始的


    public static void main(String[] args) {
        InputStream inputStream = null;
        Workbook workbook = null;


        try {
            inputStream = new FileInputStream(URL_PRE + FILE_NAME);
            String fileType = FILE_NAME.substring(FILE_NAME.lastIndexOf(".") + 1, FILE_NAME.length());

            workbook = getWorkbook(inputStream, fileType);


            handlerTest(workbook);

//            handlerBroExcel(workbook);


//            parseExcel(workbook);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                inputStream.close();
                workbook.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

    }

    private static void handlerTest(Workbook workbook) {
        Sheet firstSheet = workbook.getSheetAt(0); // sheet页

        Row firstRow = firstSheet.getRow(BEGIN_INDEX); // 行


        // 读
        Cell cell7 = firstRow.getCell(7); // 列
        String cell7Value = new DataFormatter().formatCellValue(cell7);
        System.err.println("cell7Value = " + cell7Value);

        Cell cell15 = firstRow.getCell(15); // 列
        String cell15Value = new DataFormatter().formatCellValue(cell15);
        System.err.println("cell15Value = " + cell15);


        String name = cell7Value + cell15Value.replaceAll("表","") +"数据";

        // 写
        Cell cell1 = firstRow.getCell(1);
        cell1.setCellValue(name);
//        firstCell.setCellValue("");

        try {
            File file = new File(URL_PRE + "test_20240704" + ".xlsx");

            // 创建指向该路径的输出流
            FileOutputStream stream = new FileOutputStream(file);

            // 将数据导出到Excel表格
            workbook.write(stream);

            // 关闭输出流
            stream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
```



其他一些工具类：

```java
 /**
     * 获取Cell字符串（兼容NUMERIC类型）
     */
    private static String getCellStr(@NotNull Cell cell) {
        String str = "";
        if (cell.getCellType() == CellType.NUMERIC) {
            str = NumberToTextConverter.toText(cell.getNumericCellValue());
        } else if (cell.getCellType() == CellType.STRING){
            str = cell.getStringCellValue();
        }
        return str;
    }
```

