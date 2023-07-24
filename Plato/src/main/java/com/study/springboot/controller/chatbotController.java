package com.study.springboot.controller;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dto.chatbotDTO;
import com.study.springboot.service.chatbotService;

@Controller
public class chatbotController {

	@Autowired
	chatbotService service;

	@RequestMapping("/platoChat")
	@ResponseBody
	public String platoChat(@RequestBody Map map,
			@ModelAttribute chatbotDTO dto) {

		System.out.println(map);

		
		  Map map_action = (Map)map.get("action"); 
		  String keyword = (String)((Map)((Map)map_action.get("detailParams")).get("keyword")).get("origin" ); 
		  System.out.println("keyword2 : " + keyword);
		  

		  dto.setStartNum(1);
		  dto.setEndNum(3);
		  dto.setInfo(keyword);
		  
		  Map mapmap = service.infoKeyword(dto);
			
		  List<chatbotDTO> keyResult = (List) mapmap.get("keyResult");		
		
			
			/*
			 * String title1 = keyResult.get(0).getTitle(); int postid =
			 * keyResult.get(0).getPostid(); String url1 =
			 * "http://1.222.90.55:8007/recipe?postid=" + postid; String mnpp1 =
			 * keyResult.get(0).getMnp(); String mnp1 = "http://1.222.90.55:8007/" + mnpp1;
			 * 
			 * 
			 * String title2 = keyResult.get(1).getTitle(); int postid2 =
			 * keyResult.get(1).getPostid(); String url2 =
			 * "http://1.222.90.55:8007/recipe?postid=" + postid2; String mnpp2 =
			 * keyResult.get(1).getMnp(); String mnp2 = "http://1.222.90.55:8007/" + mnpp2;
			 * 
			 * String title3 = keyResult.get(2).getTitle(); int postid3 =
			 * keyResult.get(2).getPostid(); String url3 =
			 * "http://1.222.90.55:8007/recipe?postid=" + postid3; String mnpp3 =
			 * keyResult.get(2).getMnp(); String mnp3 = "http://1.222.90.55:8007/" + mnpp3;
			 */
			 
		 	 
	
		  
		  
		  
			
			
			 
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
			/*
			 * String title3 = keyResult.get(2).getTitle(); int postid3 =
			 * keyResult.get(2).getPostid(); String url3 =
			 * "http://1.222.90.55:8007/recipe?postid=" + postid; String mnp3 =
			 * keyResult.get(2).getMnp();
			 */
		 	 
		  
		  
	/*		
			 * String result = "{" + "    \"version\": \"2.0\"," + "    \"template\": {" +
			 * "        \"outputs\": [" + "            {" +
			 * "                \"simpleText\": {" + "                    \"text\"  : \" "
			 * +keyword + "에 관한 최근레시피 알려드릴게요!" + " \" " + "                }" +
			 * "            }" + "        ]" + "    }" + "}";
			 */
		  
		  
	/*
	 * JSONObject received = new JSONObject(map);
	 * 
	 * JSONObject send = new JSONObject(); send.put("version", "2.0");
	 * 
	 * JSONObject listCardHeader = new JSONObject(); listCardHeader.put("title",
	 * keyword+"에 관한 최근레시피 알려드릴게요!");
	 * 
	 * JSONArray listCardItems = new JSONArray();
	 * 
	 * JSONObject item1 = new JSONObject(); item1.put("title", title1);
	 * item1.put("description", "새로운 AI의 내일과 일상의 변화"); item1.put("imageUrl", mnp1);
	 * JSONObject item1Link = new JSONObject(); item1Link.put("web", url1);
	 * item1.put("link", item1Link); listCardItems.add(item1);
	 * 
	 * JSONObject item2 = new JSONObject(); item2.put("title", "챗봇 관리자센터");
	 * item2.put("description", "카카오톡 채널 챗봇 만들기"); item2.put("imageUrl",
	 * "https://t1.kakaocdn.net/openbuilder/sample/img_002.jpg");
	 * item2.put("action", "block"); item2.put("blockId",
	 * "62654c249ac8ed78441532de"); JSONObject item2Extra = new JSONObject();
	 * item2Extra.put("key1", "value1"); item2Extra.put("key2", "value2");
	 * item2.put("extra", item2Extra); listCardItems.add(item2);
	 * 
	 * JSONObject item3 = new JSONObject(); item3.put("title",
	 * "Kakao i Voice Service"); item3.put("description", "보이스봇 / KVS 제휴 신청하기");
	 * item3.put("imageUrl",
	 * "https://t1.kakaocdn.net/openbuilder/sample/img_003.jpg");
	 * item3.put("action", "message"); item3.put("messageText",
	 * "Kakao i Voice Service"); JSONObject item3Extra = new JSONObject();
	 * item3Extra.put("key1", "value1"); item3Extra.put("key2", "value2");
	 * item3.put("extra", item3Extra); listCardItems.add(item3);
	 * 
	 * JSONArray buttons = new JSONArray(); JSONObject button = new JSONObject();
	 * button.put("label", "홈페이지"); button.put("action", "block");
	 * button.put("blockId", "62654c249ac8ed78441532de"); JSONObject buttonExtra =
	 * new JSONObject(); buttonExtra.put("key1", "value1"); buttonExtra.put("key2",
	 * "value2"); button.put("extra", buttonExtra); buttons.add(button);
	 * 
	 * JSONObject listCard = new JSONObject(); listCard.put("header",
	 * listCardHeader); listCard.put("items", listCardItems);
	 * listCard.put("buttons", buttons);
	 * 
	 * JSONArray outputs = new JSONArray(); JSONObject outputs1 = new JSONObject();
	 * outputs1.put("listCard", listCard); outputs.add(outputs1);
	 * 
	 * JSONObject template = new JSONObject(); template.put("outputs", outputs);
	 * 
	 * send.put("template", template);
	 */

//		  String result = "{\n" +
//			        "  \"version\": \"2.0\",\n" +
//			        "  \"template\": {\n" +
//			        "    \"outputs\": [\n" +
//			        "      {\n" +
//			        "        \"listCard\": {\n" +
//			        "          \"header\": {\n" +
//			        "            \"title\": \" " + keyword +"에 관한 최근레시피를 소개합니다." +"\"\n" +
//			        "          },\n" +
//			        "          \"items\": [\n" +
//			        "            {\n" +
//			        "              \"title\": \""+title1+"\",\n" +			      
//			        "              \"imageUrl\": \""+ mnp1 +"\",\n" +
//			        "              \"link\": {\n" +
//			        "                \"web\": \""+url1+"\"\n" +
//			        "              }\n" +  
//			        "            },\n" +
//			        "            {\n" +
//			        "              \"title\": \""+title2+"\",\n" +			      
//			        "              \"imageUrl\": \""+ mnp2 +"\",\n" +
//			        "              \"link\": {\n" +
//			        "                \"web\": \""+url2+"\"\n" +
//			        "              }\n" +  
//			        "            },\n" +
//			        "            {\n" +
//			        "              \"title\": \""+ title3 +"\",\n" +			      
//					"			\"imageUrl\": \""+ mnp3 +"\",\n" +
//					"              \"link\": {\n" +
//					"                \"web\": \""+url3+"\"\n" +
//					"              }\n" +  
//					"            }\n" +
//					"           ],\n" +
//			        "          \"buttons\": [\n" +
//			        "            {\n" +
//			        "              \"label\": \"홈페이지 방문\",\n" +
//			        "              \"action\": \"webLink\",\n" +
//			        "              \"webLinkUrl\": \"http://1.222.90.55:8007/header\"\n" +
//			        "            }\n" +
//			        "          ]\n" +
//			        "        }\n" +
//			        "      }\n" +
//			        "    ]\n" +
//			        "  }\n" +
//			        "}";

		  

//		  String result = "{\n" +
//			        "  \"version\": \"2.0\",\n" +
//			        "  \"template\": {\n" +
//			        "    \"outputs\": [\n" ;
//
//			        
			        
			        
//					  int count = Math.min(keyResult.size(), 3); 
					
//					  if (count == 0) {
//						  result +=         "      {\n" +
//							        "        \"simpleText\": {\n" +
//							        "          \"text\": \"검색결과가 없습니다ㅜㅜ\"\n" +
//							        "        }\n" +
//							        "      }\n" +
//							        "    ]\n" +
//							        "  }\n" +
//							        "}";						  
//					  }else {
//					 result += "      {\n" +
//							   "        \"listCard\": {\n" +
//							   "          \"header\": {\n" +
//							   "            \"title\": \" " + keyword +"에 관한 최근레시피를 소개합니다." +"\"\n" +
//				      		   "          },\n"+							  
//				     		   "          \"items\": [\n" ;
//					  
//					  for (int i = 0; i < count; i++) {
//						  chatbotDTO listdto = keyResult.get(i); 
//						  String title = listdto.getTitle(); 
//						  int postid = listdto.getPostid(); 
//						  String url = "http://1.222.90.55:8007/recipe?postid=" + postid; 
//						  String mnpp = listdto.getMnp(); 
//						  System.out.println("mnpp :" + mnpp);
//						  String mnp = "http://1.222.90.55:8007/" + mnpp; 
//						  
//						  result += "            {\n" +
//								  "              \"title\": \""+title+"\",\n" +			      
//								  "              \"imageUrl\": \""+ mnp +"\",\n" +
//								  "              \"link\": {\n" +
//								  "                \"web\": \""+url+"\"\n" +
//								  "              }\n" +  
//								  "            }\n" ;
//						  if (i != count-1){
//							  result += ",";
//						  }
//					  }										
//		result +=	"           ],\n" +
//					"          \"buttons\": [\n" +
//			        "            {\n" +
//			        "              \"label\": \"홈페이지 방문\",\n" +
//			        "              \"action\": \"webLink\",\n" +
//			        "              \"webLinkUrl\": \"http://1.222.90.55:8007/header\"\n" +
//			        "            }\n" +
//			        "          ]\n" +
//			        "        }\n" +
//			        "      }\n" +
//			        "    ]\n" +
			        
				/*
				 * "  \"quickReplies\": [\n" + "    {\n" + "      \"messageText\": \"처음으로\",\n"
				 * + "      \"action\": \"message\",\n" + "      \"label\": \"처음으로\"\n" +
				 * "    }\n" + "  ]\n" +
				 */

			        
			        
//			        "  }\n" +
//			        "}";
//
//					  }	  
//					  
					  
					  
					  
					  
					  
					  

					  String result = "{\n" +
						        "  \"version\": \"2.0\",\n" +
						        "  \"template\": {\n" +
						        "    \"outputs\": [\n" ;

						        
						        
						        
								  int count = Math.min(keyResult.size(), 3); 
								
								  if (count == 0) {
									  result +=         "      {\n" +
										        "        \"simpleText\": {\n" +
										        "          \"text\": \"검색결과가 없습니다ㅜㅜ\"\n" +
										        "        }\n" +
										        "      }\n" +
										        "    ]\n" +
										        "  }\n" +
										        "}";						  
								  }else {
								 result += 
									       "      {\n" +
									    	        "        \"carousel\": {\n" +
									    	        "          \"type\": \"listCard\",\n" +
									    	        "          \"items\": [\n" +
									    	        "            {\n" +
									    	        "              \"header\": {\n" +
									    	        "            \"title\": \" " + keyword +"에 관한 최근레시피를 소개합니다." +"\"\n" +
									    	        "              },\n" +
									    	        "              \"items\": [\n" ;
								  
								  for (int i = 0; i < count; i++) {
									  chatbotDTO listdto = keyResult.get(i); 
									  String title = listdto.getTitle(); 
									  int postid = listdto.getPostid(); 
									  String url = "http://1.222.90.55:8007/recipe?postid=" + postid; 
									  String mnpp = listdto.getMnp(); 
									  System.out.println("mnpp :" + mnpp);
									  String mnp = "http://1.222.90.55:8007/" + mnpp; 
									  
									  result += "            {\n" +
											  "              \"title\": \""+title+"\",\n" +			      
											  "              \"imageUrl\": \""+ mnp +"\",\n" +
											  "              \"link\": {\n" +
											  "                \"web\": \""+url+"\"\n" +
											  "              }\n" +  
											  "            }\n" ;
									  if (i != count-1){
										  result += ",";
									  }
								  }										
					result +=	
				     	"              ],\n" +
				        "              \"buttons\": [\n" +
				        "                {\n" +
				        "                  \"label\": \"홈페이지 방문\",\n" +
				        "                  \"action\": \"webLink\",\n" +
				        "                  \"webLinkUrl\" : \"http://1.222.90.55:8007/main\"\n" +
				        "                }\n" +
				        "              ]\n" +
				        "            }\n" +
				        "          ]\n" +
				        "        }\n" +
				        "      }\n" +
				        "    ],\n" +
				        "    \"quickReplies\": [\n" +
				        "      {\n" +
				        "        \"messageText\": \"처음으로\",\n" +
				        "        \"action\": \"message\",\n" +
				        "        \"label\": \"처음으로\"\n" +
				        "      }\n" +
				        "    ]\n" +
				        "  }\n" +
				        "}";
								  }	  
								  
								  
					  
					  
					  
					  
					  
					  
					  
		  System.out.println(result);
		  return result;
		 
	}
	
	
	
	/*
	 * @RequestMapping("/platoChat2")
	 * 
	 * @ResponseBody public String platoChat2(@RequestBody Map map,
	 * 
	 * @ModelAttribute chatbotDTO dto) {
	 * 
	 * System.out.println(map);
	 * 
	 * 
	 * Map map_action = (Map)map.get("action"); String ingredient =
	 * (String)((Map)((Map)map_action.get("detailParams")).get("ingredient")).get(
	 * "origin" ); System.out.println("ingredient : " + ingredient);
	 * 
	 * 
	 * dto.setStartNum(1); dto.setEndNum(3); dto.setInfo(keyword);
	 * 
	 * Map mapmap = service.infoKeyword(dto);
	 * 
	 * List<chatbotDTO> keyResult = (List) mapmap.get("keyResult");
	 * 
	 * String result = "{\n" + "  \"version\": \"2.0\",\n" + "  \"template\": {\n" +
	 * "    \"outputs\": [\n" ;
	 * 
	 * 
	 * 
	 * 
	 * int count = Math.min(keyResult.size(), 3);
	 * 
	 * if (count == 0) { result += "      {\n" + "        \"simpleText\": {\n" +
	 * "          \"text\": \"검색결과가 없습니다ㅜㅜ\"\n" + "        }\n" + "      }\n" +
	 * "    ]\n" + "  }\n" + "}"; }else { result += "      {\n" +
	 * "        \"carousel\": {\n" + "          \"type\": \"listCard\",\n" +
	 * "          \"items\": [\n" + "            {\n" +
	 * "              \"header\": {\n" + "            \"title\": \" " + keyword
	 * +"에 관한 최근레시피를 소개합니다." +"\"\n" + "              },\n" +
	 * "              \"items\": [\n" ;
	 * 
	 * for (int i = 0; i < count; i++) { chatbotDTO listdto = keyResult.get(i);
	 * String title = listdto.getTitle(); int postid = listdto.getPostid(); String
	 * url = "http://1.222.90.55:8007/recipe?postid=" + postid; String mnpp =
	 * listdto.getMnp(); System.out.println("mnpp :" + mnpp); String mnp =
	 * "http://1.222.90.55:8007/" + mnpp;
	 * 
	 * result += "            {\n" + "              \"title\": \""+title+"\",\n" +
	 * "              \"imageUrl\": \""+ mnp +"\",\n" +
	 * "              \"link\": {\n" + "                \"web\": \""+url+"\"\n" +
	 * "              }\n" + "            }\n" ; if (i != count-1){ result += ","; }
	 * } result += "              ],\n" + "              \"buttons\": [\n" +
	 * "                {\n" + "                  \"label\": \"홈페이지 방문\",\n" +
	 * "                  \"action\": \"webLink\",\n" +
	 * "                  \"webLinkUrl\" : \"http://1.222.90.55:8007/main\"\n" +
	 * "                }\n" + "              ]\n" + "            }\n" +
	 * "          ]\n" + "        }\n" + "      }\n" + "    ],\n" +
	 * "    \"quickReplies\": [\n" + "      {\n" +
	 * "        \"messageText\": \"처음으로\",\n" + "        \"action\": \"message\",\n"
	 * + "        \"label\": \"처음으로\"\n" + "      }\n" + "    ]\n" + "  }\n" + "}";
	 * }
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * System.out.println(result); return result;
	 * 
	 * }
	 */

}
