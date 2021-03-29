package jdbc.sec02;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

public class BookSelectPreEx {

	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = DBConnect.getConnection();

			System.out.println("���� ���� ��ȸ");

			// SQL�� �ۼ�
			String sql = "select * from book order by bookNo";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // select ���������� executeQuery() �޼ҵ� ���
			
			System.out.println("���� ���� ��ȸ");
			System.out.println("-------------------------------------------------");
			System.out.println("������ȣ \t ������ \t\t\t\t ���� \t\t ���� \t\t ������ \t\t��� \t\t���ǻ��ȣ");
			System.out.println("-------------------------------------------------");
			
			// ResultSet�� next() �޼ҵ� ����ؼ� �� �྿ ������ �����ϰ� ���
			// �ݺ��� ���
			// next() : ���� ���� ������ true ��ȯ, ������ false ��ȯ
			while (rs.next()) {
				String bookNo = rs.getString(1);
				String bookName = rs.getString(2);
				String bookAuthor = rs.getString(3);
				int bookPrice = rs.getInt(4);
				Date bookDate = rs.getDate(5);
				int bookStock = rs.getInt(6);
				String pubNo = rs.getString(7);

				// �� �྿ ���
				System.out.format("%-10s\t %-25s\t %-10s %6d %13s \t%3d %10s", bookNo, bookName, bookAuthor, bookPrice,
						bookDate, bookStock, pubNo);

				System.out.println();
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnect.close(con, pstmt, rs);
		}

	}

}