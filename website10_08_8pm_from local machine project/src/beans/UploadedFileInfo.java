package beans;

import java.sql.Timestamp;
import java.util.List;

public class UploadedFileInfo
{
  private int video_info_id;	
  private int user_id;
  private String primary_file_ext;
  private String sec_file_ext;
  private String player_name;
  private String version_name;
  private String manufacturer;
  private String manufacture_web;
  private String modelno;
  private String videofile_type;
  private String decoder_conv;
  private String conv_file;
  private String file_source;
  private String total_size;
  private String no_of_cameras;
  private Timestamp uploaded_date;
  private List<UploadedFiles> listOfUploadedFiles;
  
  

public List<UploadedFiles> getListOfUploadedFiles() {
	return listOfUploadedFiles;
}
public void setListOfUploadedFiles(List<UploadedFiles> listOfUploadedFiles) {
	this.listOfUploadedFiles = listOfUploadedFiles;
}
public Timestamp getUploaded_date() {
	return uploaded_date;
}
public void setUploaded_date(Timestamp uploaded_date) {
	this.uploaded_date = uploaded_date;
}
public int getVideo_info_id() {
	return video_info_id;
}
public void setVideo_info_id(int video_info_id) {
	this.video_info_id = video_info_id;
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
}
public String getPrimary_file_ext() {
	return primary_file_ext;
}
public void setPrimary_file_ext(String primary_file_ext) {
	this.primary_file_ext = primary_file_ext;
}
public String getSec_file_ext() {
	return sec_file_ext;
}
public void setSec_file_ext(String sec_file_ext) {
	this.sec_file_ext = sec_file_ext;
}
public String getPlayer_name() {
	return player_name;
}
public void setPlayer_name(String player_name) {
	this.player_name = player_name;
}
public String getVersion_name() {
	return version_name;
}
public void setVersion_name(String version_name) {
	this.version_name = version_name;
}
public String getManufacturer() {
	return manufacturer;
}
public void setManufacturer(String manufacturer) {
	this.manufacturer = manufacturer;
}
public String getManufacture_web() {
	return manufacture_web;
}
public void setManufacture_web(String manufacture_web) {
	this.manufacture_web = manufacture_web;
}
public String getModelno() {
	return modelno;
}
public void setModelno(String modelno) {
	this.modelno = modelno;
}
public String getVideofile_type() {
	return videofile_type;
}
public void setVideofile_type(String videofile_type) {
	this.videofile_type = videofile_type;
}
public String getDecoder_conv() {
	return decoder_conv;
}
public void setDecoder_conv(String decoder_conv) {
	this.decoder_conv = decoder_conv;
}
public String getConv_file() {
	return conv_file;
}
public void setConv_file(String conv_file) {
	this.conv_file = conv_file;
}
public String getFile_source() {
	return file_source;
}
public void setFile_source(String file_source) {
	this.file_source = file_source;
}
public String getTotal_size() {
	return total_size;
}
public void setTotal_size(String total_size) {
	this.total_size = total_size;
}
public String getNo_of_cameras() {
	return no_of_cameras;
}
public void setNo_of_cameras(String no_of_cameras) {
	this.no_of_cameras = no_of_cameras;
}

  
}