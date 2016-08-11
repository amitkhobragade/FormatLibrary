package beans;

import java.sql.Timestamp;

public class UploadedFiles 
{
    private int file_id;
    private int video_info_id;
    private String 	video_file_path;
    private String file_size;
    private Timestamp file_uploaded_date;
    
    
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	public int getVideo_info_id() {
		return video_info_id;
	}
	public void setVideo_info_id(int video_info_id) {
		this.video_info_id = video_info_id;
	}
	public String getVideo_file_path() {
		return video_file_path;
	}
	public void setVideo_file_path(String video_file_path) {
		this.video_file_path = video_file_path;
	}
	
	public String getFile_size() {
		return file_size;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	public Timestamp getFile_uploaded_date() {
		return file_uploaded_date;
	}
	public void setFile_uploaded_date(Timestamp file_uploaded_date) {
		this.file_uploaded_date = file_uploaded_date;
	}
}
