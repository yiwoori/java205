package ex.io;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

public class FileReaderStream {

	public static void main(String[] args) {
		
		
		
		try {
			
			// 문자 단위로 읽어올 스트림 생성
			// Reader -> FileReader
			
			Reader in = new FileReader("hyper.txt");
			
			char[] cbuf = new char[10];
			int readLen = 0; //초기화
			
			readLen = in.read(cbuf, 0, cbuf.length);
			
			for(int i=0; i<readLen; i++) {
				System.out.println(cbuf[i]);
			}
			
			
			in.close();
			System.out.println("읽기 완료");
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
	}

}
