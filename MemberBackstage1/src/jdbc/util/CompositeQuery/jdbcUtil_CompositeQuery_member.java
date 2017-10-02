/*
 *  1. 萬用複合查詢-可由客戶端隨意增減任何想查詢的欄位
 *  2. 為了避免影響效能:
 *        所以動態產生萬用SQL的部份,本範例無意採用MetaData的方式,也只針對個別的Table自行視需要而個別製作之
 * */



package jdbc.util.CompositeQuery;

import java.util.*;

public class jdbcUtil_CompositeQuery_member {

	public static String get_aCondition_For_Oracle(String columnName, String value) {

		String aCondition = null;

		if ("memberNo".equals(columnName)){ // 用於其他
			if(value!=null)
			aCondition = columnName + "=" + value;}
		else if ("state".equals(columnName)||"account".equals(columnName)||"superior".equals(columnName)||"superior2".equals(columnName)){ // 用於varchar
			if(value!=null)
			aCondition = columnName + " like '%" + value + "%'";
			}
		else if ("level".equals(columnName)){ // 用於varchar
			if(value!=null)
			aCondition = columnName + " = '" + value + "'";
			}
		
		

		return aCondition + " ";
	}

	public static String get_WhereCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0	&& !"action".equals(key)&& !"url".equals(key)) {
				count++;
				String aCondition = get_aCondition_For_Oracle(key, value.trim());

				if (count == 1)
					whereCondition.append(" where " + aCondition);
				else
					whereCondition.append(" and " + aCondition);

				System.out.println("有送出查詢資料的欄位數count = " + count);
			}
		}
		
		return whereCondition.toString();
	}

	public static void main(String argv[]) {

		// 配合 req.getParameterMap()方法 回傳 java.util.Map<java.lang.String,java.lang.String[]> 之測試
		
		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("memberNo", new String[] { "" });
		map.put("state", new String[] { "启用" });
		map.put("level", new String[] { "代理" });
		map.put("superior", new String[] { "" });
		map.put("superior2", new String[] { "aaa" });
		map.put("account", new String[] { "" });
		map.put("action", new String[] { "123" }); // 注意Map裡面會含有action的key
		map.put("url", new String[] { "123" });
		String finalSQL = "select * from member "
				          + jdbcUtil_CompositeQuery_member.get_WhereCondition(map)
				          + "order by memberNo";
		System.out.println("●●finalSQL = " + finalSQL);

	}
}
