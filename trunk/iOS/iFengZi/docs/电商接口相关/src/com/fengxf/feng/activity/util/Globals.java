package com.fengxf.feng.activity.util;

public class Globals {
	
	//�Ƿ����logo
	public static boolean isLogo =false;
	//ҵ������
	public static int TYPE=0;
	//ҵ�����
	public static Object qrObj;
	//��ý��mediakey�����ڱ���ʱ
	public static Object qrMediaKey;
	/**ϵͳ����**/
	public static String  CUR_NETWORK="WIFI";
	public static String  CUR_NETWORK_WIFI="WIFI";
	public static String  CUR_NETWORK_3G="3G";
	public static String  CUR_NETWORK_NONE=""; 
	public static String TOKEN = "uLN9UhI9Uhd-UhGGuh78uQ";
	public static final int QROBJTYPE_HTTP=1;//��ַ
	public static final int QROBJTYPE_WEBCARD=2;// ��ҳ��ǩ
	public static final int QROBJTYPE_APK=3;//  Ӧ�ó���
	public static final int QROBJTYPE_WEIBO=4;//΢��
	public static final int QROBJTYPE_CARD=5;//��Ƭ
	public static final int QROBJTYPE_TEL=6;//�绰��
	public static final int QROBJTYPE_EMAIL=7;//�ʼ�
	public static final int QROBJTYPE_TXE=8;//�ı�
	public static final int QROBJTYPE_UNTXT=9;//�����ı�
	public static final int QROBJTYPE_SM=10;//����
	public static final int QROBJTYPE_WIFI=11;//wifi
	public static final int QROBJTYPE_MAP=12;//��ͼ
	public static final int QROBJTYPE_DATE=13;// �ճ�
	public static final int QROBJTYPE_DYNAMIC=14;// ��ý��Ϳ��븳ֵ
	
	public static Class sendBackClass;// �ճ�

	public static final String PHONEBOOKNUMBER = "";
	public static final String MAPURL="http://ditu.google.cn/maps?ll=";//27.939592,107.11118699999997&z=12";
	public static final String SFBL="&z=12";

	public static final String DOMAIN="http://220.231.48.34:7000/"; 
	public static final String DOMAIN_WEBNAMW="eshop"; 
	public static final String DYNAMIC="http://192.168.1.60:8080/"+"mb/dynamic";//��ý��
	public static final String KMA="http://192.168.1.60:8080/"+"mb/kma";//����

	//creat for sunchao
	
	public static final String DYNAMIC_TEXT_UPLOAD=DOMAIN+"/mb/kma/m_uploadTraditionInfo.action";//13���ı�ҵ���ϴ���ַ
	public static final String DYNAMIC_SOUND_UPLOAD=DOMAIN+"mb/dynamic/m_soundUpload.action";//��Ƶ�ϴ�
	public static final String DYNAMIC_VIDEO_UPLOAD=DOMAIN+"mb/dynamic/m_videoUpload.action";//��Ƶ�ϴ�
	public static final String DYNAMIC_PIC_UPLOAD=DOMAIN+"mb/dynamic/m_picUpload.action";//ͼƬ�ϴ�
	public static final String DYNAMIC_FLASH_UPLOAD=DOMAIN+"mb/dynamic/m_flashUpload.action";//FLASH�ϴ�
	public static final String DYNAMIC_UPLOAD=DOMAIN+"mb/dynamic/m_uploadMediaInfo.action";//��ý���ϴ�
	public static final String DYNAMIC_UPLOADINFO=DOMAIN+"mb/dynamic/m_uploadCodeIinfo.action";//��ý����Ϣ�ϴ�
	public static final String DYNAMIC_SOUND_ENDWITH=".midi<>.amr<>.mp3<>.wav";//��ý����Ƶ֧�ָ�ʽ <>��Ϊ��ʽ�ָ���
	public static final String DYNAMIC_PIC_ENDWITH=".jpg<>.gif<>.png";//��ý����Ƶ֧�ָ�ʽ<>��Ϊ��ʽ�ָ���
	public static final String DYNAMIC_VIDEO_ENDWITH=".gif<>.mms<>.cmx<>.Sis<>.3gp<>.mp4";//��ý����Ƶ֧�ָ�ʽ<>��Ϊ��ʽ�ָ���
	public static final String DYNAMIC_FLASH_ENDWITH=".swf<>.flv";//��ý����Ƶ֧�ָ�ʽ<>��Ϊ��ʽ�ָ���
	public static String UPLOAD_TOKEN="uLN9UhI9Uhd-UhGGuh78uQ";
	
	
	
	/****��¼�͸������Ľӿڵ�ַ****/
	public static final String FENG_LOGIN = "http://192.168.1.60:8080/uc/m_login.action";//��¼
	public static final String FENG_FORGET_PWD = "http://192.168.1.60:8080/uc/m_resetpass.action"; //��������
	public static final String FENG_GET_CHECKBOX = "http://192.168.1.60:8080/uc/m_genCheckCode.action";//�ֻ��·���֤��
	public static final String FENG_REGISTER = "http://192.168.1.60:8080/uc/m_register.action";//ע��
	public static final String MODIFY_PWD_URL="http://192.168.1.60:8080/uc/m_modpass.action";//�޸�����
	public static final String MODIFY_NICKNAME_URL = "http://192.168.1.60:8080/uc/m_modnicname.action";//�޸��ǳ�
	public static final String FENG_MYCODE_URL = "http://192.168.1.60:8080/mb/kma/m_getCodeList.action";//�ҵ����б�
	public static final String FENG_FEEDBACK_URL = "http://192.168.1.60:8080/mb/fb/fb.action";//��������ӿ�
	/****������ʽ****/
	public static final String PHONE_REGEX = "^((\\+86)|(86))?(13[0-9]|15[0-9]|18[8|9]) \\d{8}$";//�ֻ�����������ʽ
	public static final String EMAIL_REGEX = "^ \\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$";//�ʼ�������ʽ
	/**�û���Ϣ**/
	public static int USERID = 0;
	public static String USERNAME = "";
	public static String USERPWD = "";
	public static String USERNICK = "";
	
	public static  final String Tag="Feng";
	public static final String FENG_ESHOP_MAIN =DOMAIN+DOMAIN_WEBNAMW+"/main.action"; 
	public static final String FENG_ESHOP_DOWNLOAD = DOMAIN+DOMAIN_WEBNAMW+"book.txt";
	public static final String FENG_ESHOP_BRAND = DOMAIN+DOMAIN_WEBNAMW+"/person.action"; 
	public static final String FENG_ESHOP_COMMENT = DOMAIN+DOMAIN_WEBNAMW+"/commnetlist.action"; 
	public static final String FENG_ESHOP_COMMENT_SUBMIT = DOMAIN+DOMAIN_WEBNAMW+"/commnet.action"; 
	
	public static final String FENG_ESHOP_INFO = DOMAIN+DOMAIN_WEBNAMW+"/info.action"; 
	public static final String FENG_ESHOP_ORDER = DOMAIN+DOMAIN_WEBNAMW+"/order.action"; 
	public static final String FENG_ESHOP_PUBLISH = DOMAIN+DOMAIN_WEBNAMW+"/publish.action"; 
	public static final String FENG_ESHOP_ORDERLIST = DOMAIN+DOMAIN_WEBNAMW+"/orderlist.action"; 
	
	//����
	public static int ISKMA = 0;
	public static int KMAID = 0;
	
	/*����URL*/
	public static final String Host="192.168.2.115:8080";
	/*��Ʒ����*/ 
	public static final String EBUY_SEARCH="http://"+Host+"/ebuy/search";
	/*��Ʒ�Ƽ�*/
	public static final String EBUY_PUSH="http://"+Host+"/ebuy/push";
	/*����*/
	public static final String EBUY_TYPE="http://"+Host+"/ebuy/type";
	/*����*/
	public static final String EBUY_GOODSLIST="http://"+Host+"/ebuy/goodslist";
	/*�챨��Ѷ�Ƽ�*/
	public static final String EBUY_NEW="http://"+Host+"/ebuy/new";
	/*�챨��Ѷ����*/
	public static final String EBUY_MESSAGENEWINFO="http://"+Host+"/ebuy/messagenewinfo";
	/*վ�����б�-�ռ���*/
	public static final String EBUY_MESSAGE_RECV="http://"+Host+"/ebuy/messagerecv";
	/*վ�����б�-������*/
	public static final String EBUY_MESSAGE_SEND="http://"+Host+"/ebuy/messagesend";
	/*վ������Ϣ����*/
	public static final String EBUY_MESSAGEINFO="http://"+Host+"/ebuy/messageinfo";
	/*վ�ڻظ�*/
	public static final String EBUY_ADDMESSAGE="http://"+Host+"/ebuy/addmessage";
	/*������ȡ�б�*/
	public static final String EBUY_ORDERLIST="http://"+Host+"/ebuy/orderlist";
	/*�ҵ��ղ��б�*/
	public static final String EBUY_COLLECT="http://"+Host+"/ebuy/collect";
	/*���һ���ղ�*/
	public static final String EBUY_ADDCOLLECT="http://"+Host+"/ebuy/addcollect";
	/*ɾ��һ���ղ�*/
	public static final String EBUY_DELCOLLECT="http://"+Host+"/ebuy/delcollect";
	/*�ĵú������б�*/
	public static final String EBUY_ADDCOMMENT="http://"+Host+"/ebuy/addcomment";
	/*��������*/
	public static final String EBUY_SDANDCOMMENTLIST="http://"+Host+"/ebuy/sdandcomentlist";

	/*��Ʒ����*/
	public static final String EBUY_GOODINFO="http://"+Host+"/ebuy/goodsinfo";
	/*�鿴��Ʒ����*/
	public static final String EBUY_GOODCOMMENT="http://"+Host+"/ebuy/goodscomment";
	/*��Ʒ�ĵ��б�*/
	public static final String EBUY_REALIZE="http://"+Host+"/ebuy/realize";
	/*��Ʒ�ĵ�����*/
	public static final String EBUY_REALIZEINFO="http://"+Host+"/ebuy/realizeinfo";
	/*�����ӿ�*/
	public static final String EBUY_ORDER="http://"+Host+"/ebuy/order";
	/*��������*/
	public static final String EBUY_ORDER_INFO="http://"+Host+"/ebuy/orderinfo";
	/*�ϴ�ͼƬ�ӿ�*/
	public static final String EBUY_UPLOAD_PIC="http://"+Host+"/ebuy/file/pic";
	
}
