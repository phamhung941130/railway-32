package com.vti.backend;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Queue;
import java.util.Set;
import java.util.SortedSet;
import java.util.Stack;
import java.util.TreeMap;
import java.util.TreeSet;

import com.vti.entity.Student;
import com.vti.ultis.ScannerUltis;

public class Exercise1 {
	private static List<Student> studentArrayList;

	public Exercise1() {
		studentArrayList = new ArrayList<Student>();
		Student student1 = new Student("Dung");
		Student student2 = new Student("MinhAnh");
		Student student3 = new Student("Quang");
		Student student4 = new Student("Lap");
		Student student5 = new Student("Dat");
		Student student6 = new Student("Hieu");
		Student student7 = new Student("Dat");

		studentArrayList.add(student1);
		studentArrayList.add(student2);
		studentArrayList.add(student3);
		studentArrayList.add(student4);
		studentArrayList.add(student5);
		studentArrayList.add(student6);
		studentArrayList.add(student7);
	}

	public static void Question1() {
		while (true) {
			loadmenuQuestion1();
			int choose = ScannerUltis.inputIntPositive();
			switch (choose) {
			case 1:
				System.out.println("1,in ra tong so phan tu");
				System.out.println("tong so phan tu la :" + studentArrayList.size());
				break;
			case 2:
				System.out.println("b,lay ra phan tu so 4");
				System.out.println("phan tu so 4 la: " + studentArrayList.get(3));
				break;
			case 3:
				System.out.println("c,lay ra phan tu dau va cuoi");
				System.out.println("phan tu dau tien: " + studentArrayList.get(0));
				System.out.println("phan tu cuoi cung: " + studentArrayList.get(studentArrayList.size() - 1));
				break;
			case 4:
				System.out.println("d, them phan tu vao vi tri dau tien");
				Student student8 = new Student("student8");
				studentArrayList.add(0, student8);
				for (Student student : studentArrayList) {
					System.out.println(student.toString());
				}
				break;
			case 5:
				System.out.println("e, them phan tu vao vi tri cuoi cung");
				Student student9 = new Student("student9");
				studentArrayList.add((studentArrayList.size()), student9);
				for (Student student : studentArrayList) {
					System.out.println(student.toString());
				}

				break;
			case 6:
				System.out.println("---f---");
				Collections.reverse(studentArrayList);
				for (Student student : studentArrayList) {
					System.out.println(student.toString());
				}
				break;
			case 7:
				Question1g();
				break;
			case 8:
				duplicateNamestudent();
				break;
			case 9:
				System.out.println("nhap vao Id can xoa ten");
				int delName = ScannerUltis.inputIntPositive();
				for (Student student : studentArrayList) {
					if (student.getId() == delName) {
						student.setName(null);
						System.out.println(student.toString());
					}
				}
				break;
			case 10:
				System.out.println("-----------k, Delete student co id = 5-------------");
				Iterator<Student> iterator = studentArrayList.iterator();
				while (iterator.hasNext()) {
					Student student = iterator.next();
					if (student.getId() == 5) {
						iterator.remove();
					}
				}
				System.out.println("thong tin arraylist sau khi xoa");
				for (Student student : studentArrayList) {
					System.out.println(student.toString());
				}
				break;
			case 11:
				List<Student> studentCopies = new ArrayList<Student>();
				studentCopies.addAll(studentArrayList);
				System.out.println("phan tu trong studentCopies: ");
				for (Student student : studentCopies) {
					System.out.println(student);
				}
				break;
			default:
				break;
			}
		}
	}

	private static void duplicateNamestudent() {
		System.out.println("Student trung ten: ");
		for (int i = 0; i < studentArrayList.size(); i++) {
			for (int j = 0; j < studentArrayList.size(); j++) {
				if (studentArrayList.get(i).getName().equals(studentArrayList.get(j).getName())) {
					System.out.println(studentArrayList.get(i).toString());
				}
			}
		}
	}

	private static void loadmenuQuestion1() {
		System.out.println("moi ban chon bai tap muon xem");
		System.out.println("1) In ra tổng số phần tử của students");
		System.out.println("2) Lấy phần tử thứ 4 của students");
		System.out.println("3) In ra phần tử đầu và phần tử cuối của students");
		System.out.println("4) Thêm 1 phần tử vào vị trí đầu của students");
		System.out.println("5) Thêm 1 phần tử vào vị trí cuối của students");
		System.out.println("6) Đảo ngược vị trí của students");
		System.out.println("7) Tạo 1 method tìm kiếm student theo name");
		System.out.println("8) Tạo 1 method để in ra các student có trùng tên");
		System.out.println("9) Xóa name của student có id = 2");
		System.out.println("10) Delete student có id = 5;");
		System.out.println("11) Tạo 1 ArrayList tên là studentCopies và add tất cả students vào studentCopies");
	}

	public static void Question1g() {
		List<Student> studentArrayList = new ArrayList<Student>();
		System.out.println("moi ban nhap vao name can tim");
		String a = ScannerUltis.inputString();
		Iterator<Student> iterator = studentArrayList.iterator();
		while (iterator.hasNext()) {
			Student student = iterator.next();
			if (student.getName().equals(a)) {
				System.out.println(student.toString());
			} else {
				System.out.println("ko co student can tim");
			}
			return;
		}

	}

	public static void Question2() {
		Stack<Student> stackStudent = new Stack<Student>();
		while (true) {
			loadMenuQuestion2();
			switch (ScannerUltis.inputIntPositive()) {
			case 1:
				System.out.println("Nhập số sinh viên muốn tạo: ");
				int num2 = ScannerUltis.inputIntPositive();
				for (int i = 0; i < num2; i++) {
					Student st = new Student("Student Ques2 " + (i + 1));
					stackStudent.push(st);
				}
				System.out.println("Tạo thành công " + stackStudent.size() + " sinh viên.");
				System.out.println("Danh sách sinh viên vừa tạo: " + stackStudent.toString());
				break;
			case 2:
				System.out.println("Thứ tự sinh viên theo thứ tự từ sớm nhất đến muộn nhất dùng Stack: ");
				Iterator<Student> iteratorStudent = stackStudent.iterator();
				while (iteratorStudent.hasNext()) {
					Student st = iteratorStudent.next();
					System.out.println(st);
				}
				break;
			case 3:
				System.out.println("Sinh viên đến muộn nhất: " + stackStudent.peek());
				System.out.println("Thứ tự sinh viên theo thứ tự từ muộn nhất đến sớm nhất dùng Stack: ");
				for (int i = 0; i < stackStudent.size(); i++) {
					System.out.println(stackStudent.pop());
				}
				System.out.println("Số sinh viên còn lại trong Stack: " + stackStudent.size());
				break;
			case 4:
//*****************Khởi tạo Queue:
				Queue<Student> studentQueue = new LinkedList<Student>();
				System.out.println("Nhập vào số sinh viên muốn quản lý bằng Queue: ");
				int num4 = ScannerUltis.inputIntPositive();
				for (int i = 0; i < num4; i++) {
					Student st4 = new Student("Student Queue " + (i + 1));
					studentQueue.add(st4);
				}
				System.out.println("Đã thêm " + num4 + " sinh viên vào queue thành công.");
				System.out.println("Danh sách sinh viên vừa thêm: " + studentQueue.toString());
				System.out.println(
						"Danh sách sinh viên theo thứ tự từ sớm nhất tới muộn nhất dùng Poll để lấy dữ liệu: ");
				for (int i = 0; i < num4; i++) {
					System.out.println(studentQueue.poll());
				}
				System.out.println("Danh sách sinh viên còn lại trong Queue: " + studentQueue.size());
				break;
			case 5:
				return;
			default:
				System.out.println("Nhập lại: ");
				break;
			}
		}

	}

	private static void loadMenuQuestion2() {
		System.out.println("---             Chọn Question 2:                                                 ---");
		System.out.println("---             1.Tạo danh sách sinh viên sử dụng Stack                          ---");
		System.out.println("---             2.Thứ tự SV đến từ sớm nhất đến muộn nhất Stack                  ---");
		System.out.println("---             3.Lấy ra SV đến muộn nhất                                        ---");
		System.out.println("---             4.Thứ tự SV đến từ sớm nhất đến muộn nhất Queue                  ---");
		System.out.println("---             10.Exit                                                          ---");

	}

//Queue lưu đối tượng theo kiểu xếp hàng 
	public static void question2queue() {
		Student student1 = new Student("Dung");
		Student student2 = new Student("MinhAnh");
		Student student3 = new Student("Quang");
		Student student4 = new Student("Lap");
		Student student5 = new Student("Dat");
		Student student6 = new Student("Hieu");
		Student student7 = new Student("Dat");
		Queue<Student> studentQueue = new LinkedList<Student>();
		studentQueue.add(student1);
		studentQueue.add(student2);
		studentQueue.add(student3);
		studentQueue.add(student4);
		studentQueue.add(student5);
		studentQueue.add(student6);
		studentQueue.add(student7);
//dung iteror
		System.out.println("su dung Iterator cho queue");
		Iterator<Student> iteratorQueue = studentQueue.iterator();
		while (iteratorQueue.hasNext()) {
			Student student = iteratorQueue.next();
			System.out.println(student.toString());
		}
//		poll lấy dữ liệu tạo đầu tiên ra hẳn khỏi dãy lưu trữ
//		peek lấy dữ liệu đầu tiên ra sử dụng và dữ liệu vẫn còn trong dãy lưu trữ
		System.out.println("su dung poll");
		System.out.println(studentQueue.poll().toString());
		System.out.println(studentQueue.poll().toString());

		System.out.println("dl con lai:");
		Iterator<Student> iteratorQueue1 = studentQueue.iterator();
		while (iteratorQueue1.hasNext()) {
			Student student = iteratorQueue1.next();
			System.out.println(student.toString());
		}
		System.out.println("su dung peek: ");
		System.out.println(studentQueue.peek().toString());
		System.out.println(studentQueue.peek().toString());
		System.out.println(studentQueue.peek().toString());
		System.out.println("dl con lai:");
		Iterator<Student> iteratorQueue2 = studentQueue.iterator();
		while (iteratorQueue2.hasNext()) {
			Student student = iteratorQueue2.next();
			System.out.println(student.toString());
		}
	}

	public static void question3HashSet() {
		Student student1 = new Student("Dung");
		Student student2 = new Student("MinhAnh");
		Student student3 = new Student("Quang");
		Student student4 = new Student("Lap");
		Student student5 = new Student("Dat");
		Student student6 = new Student("Hieu");
		Student student7 = new Student("Dat");
		Set<Student> studentHashSet = new HashSet<Student>();
// HashSet lưu trữ đối tượng Ko trùng lặp và ko theo thứ tự
		studentHashSet.add(student1);
		studentHashSet.add(student2);
		studentHashSet.add(student3);
		studentHashSet.add(student4);
		studentHashSet.add(student5);
		studentHashSet.add(student6);
		studentHashSet.add(student7);
		studentHashSet.add(student7);

		Iterator<Student> iteratorHashSet = studentHashSet.iterator();
		while (iteratorHashSet.hasNext()) {
			Student student = iteratorHashSet.next();
			System.out.println(student.toString());
		}
	}

	public static void question3TreeSet() {
// TreeSet Lưu trữ dữ liệu ko trùng lặp, sắp xếp dữ liệu theo thứ tự AlpaB
		SortedSet<String> studentTreeSet = new TreeSet<String>();

		studentTreeSet.add("D");
		studentTreeSet.add("C");
		studentTreeSet.add("A");
		studentTreeSet.add("B");
		studentTreeSet.add("F");
		studentTreeSet.add("G");
		studentTreeSet.add("E");
		studentTreeSet.add("A");

		Iterator<String> iteratorTreeSet = studentTreeSet.iterator();
		while (iteratorTreeSet.hasNext()) {
			String studentName = iteratorTreeSet.next();
			System.out.println(studentName.toString());
		}
	}

	public static void question6() {
		System.out.println("--------------Demo Map---------------");
		Map<Integer, String> nameStudentHashMap = new HashMap<Integer, String>();
		nameStudentHashMap.put(1, "Trang");
		nameStudentHashMap.put(4, "Tuan");
		nameStudentHashMap.put(3, "Hieu");
		nameStudentHashMap.put(5, "Quyen");
		nameStudentHashMap.put(2, "Tuan Anh");
		nameStudentHashMap.put(6, "Dat");

		System.out.println("In thong tin cac ban hoc vien trong Map");
		System.out.println("---in thong tin su dung Foreach---");
		for (Map.Entry<Integer, String> studentName : nameStudentHashMap.entrySet()) {
			System.out.println("STT: " + studentName.getKey() + " Name: " + studentName.getValue());
		}
		System.out.println("in thong tin su dung intertor");
		Iterator<Map.Entry<Integer, String>> iterratorHashMap = nameStudentHashMap.entrySet().iterator();
		while (iterratorHashMap.hasNext()) {
			Entry<Integer, String> nameStudent = iterratorHashMap.next();
			System.out.println("STT: " + nameStudent.getKey() + " Name: " + nameStudent.getValue());

		}
	}

	public static void questiontreemap() {
		Map<Integer, String> nameStudentTreeMap = new TreeMap<Integer, String>();
		nameStudentTreeMap.put(1, "Trang");
		nameStudentTreeMap.put(4, "Tuan");
		nameStudentTreeMap.put(3, "Hieu");
		nameStudentTreeMap.put(5, "Quyen");
		nameStudentTreeMap.put(2, "Tuan Anh");
		nameStudentTreeMap.put(6, "Dat");
		System.out.println("In thong tin su dung Foreach");
		for (Entry<Integer, String> student : nameStudentTreeMap.entrySet()) {
			System.out.println("Stt: " + student.getKey() + " Name: " + student.getValue());
		}
		System.out.println("In thong tin su dung Iterator");
		Iterator<Entry<Integer, String>> iterator = nameStudentTreeMap.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<Integer, String> studentNamEntry = iterator.next();
			System.out.println("STT: " + studentNamEntry.getKey() + " Name: " + studentNamEntry.getValue());

		}
	}
}