package com.vti.frontend;

import java.time.LocalDate;

import com.vti.entity.Account;
import com.vti.entity.Answer;
import com.vti.entity.CategoryQuestion;
import com.vti.entity.Department;
import com.vti.entity.Exam;
import com.vti.entity.Group;
import com.vti.entity.Position;
import com.vti.entity.Question;
import com.vti.entity.TypeQuestion;

public class demo {
	public static void main(String[] args) {
//	insert department
		Department dep1 = new Department();
		dep1.id = 1;
		dep1.name = "Sale";

		Department dep2 = new Department();
		dep2.id = 2;
		dep2.name = "Maketing";

		Department dep3 = new Department();
		dep3.id = 3;
		dep3.name = "kỹ thuật";

//	insert position
		Position pos1 = new Position();
		pos1.id = 1;
		pos1.name = Position.positionName.Dev;

		Position pos2 = new Position();
		pos2.id = 2;
		pos2.name = Position.positionName.PM;

		Position pos3 = new Position();
		pos3.id = 3;
		pos3.name = Position.positionName.Scrum_Master;

// insert group
		Group g1 = new Group();
		g1.id = 1;
		g1.name = "developer";

		Group g2 = new Group();
		g2.id = 2;
		g2.name = "Sale";

		Group g3 = new Group();
		g3.id = 3;
		g3.name = "maketing";
// insert account
		Account acc1 = new Account();
		acc1.id = 1;
		acc1.email = "email1@gmail.com";
		acc1.userName = "UserName1";
		acc1.fullName = "FullName1";
		acc1.department = dep2;
		acc1.position = pos1;
		acc1.createDate = LocalDate.now();
		Group[] groupAcc1 = { g1, g2 };
		acc1.groups = groupAcc1;

		Account acc2 = new Account();
		acc2.id = 2;
		acc2.email = "email2@gmail.com";
		acc2.userName = "UserName2";
		acc2.fullName = "FullName2";
		acc2.department = dep1;
		acc2.position = pos2;
		acc2.createDate = LocalDate.now();
		Group[] groupAcc2 = { g2, g3 };
		acc2.groups = groupAcc2;

		Account acc3 = new Account();
		acc3.id = 3;
		acc3.email = "email3@gmail.com";
		acc3.userName = "UserName3";
		acc3.fullName = "FullName3";
		acc3.department = dep3;
		acc3.position = pos1;
		acc3.createDate = LocalDate.now();
		Group[] groupAcc3 = { g1, g3 };
		acc3.groups = groupAcc3;
// insert TypeQuestion
		TypeQuestion tq1 = new TypeQuestion();
		tq1.id = 1;
		tq1.name = TypeQuestion.TypeName.ESSAY;

		TypeQuestion tq2 = new TypeQuestion();
		tq2.id = 1;
		tq2.name = TypeQuestion.TypeName.MULTIPLECHOICE;
// insert CategoryQuestion
		CategoryQuestion cq1 = new CategoryQuestion();
		cq1.id = 1;
		cq1.name = "java";

		CategoryQuestion cq2 = new CategoryQuestion();
		cq2.id = 2;
		cq2.name = "SQL";

		CategoryQuestion cq3 = new CategoryQuestion();
		cq3.id = 3;
		cq3.name = "Ruby";
//Insert exam
		Exam ex1 = new Exam();
		ex1.id = 1;
		ex1.code = "java1";
		ex1.title = "đề thi java";
		ex1.category = cq1;
		ex1.duration = 60;
		ex1.creator = acc1;
		ex1.createDate = LocalDate.of(2022, 01, 10);

		Exam ex2 = new Exam();
		ex2.id = 2;
		ex2.title = "đề thi sql";

		Exam ex3 = new Exam();
		ex3.id = 3;
		ex3.title = "đề thi Ruby";

//Insert Question
		Question q1 = new Question();
		q1.id = 1;
		q1.content = "question java";
		q1.category = cq1;
		q1.type = tq1;
		q1.creator = acc2;
		q1.createDate = LocalDate.now();
		Exam[] exam1 = { ex1, ex3 };
		q1.exams = exam1;

		Question q2 = new Question();
		q2.id = 2;
		q2.content = "question sql";
		q2.category = cq2;
		q2.type = tq1;
		q2.creator = acc1;
		q2.createDate = LocalDate.now();
		Exam[] exam2 = { ex1, ex2 };
		q2.exams = exam2;

		Question q3 = new Question();
		q3.id = 3;
		q3.content = "question ruby";
		q3.category = cq3;
		q3.type = tq2;
		q3.creator = acc3;
		q3.createDate = LocalDate.now();
		Exam[] exam3 = { ex2, ex3 };
		q3.exams = exam3;
//Insert answer 
		Answer a1 = new Answer();
		a1.id = 1;
		a1.content = "tl java";
		a1.question = q3;
		a1.isCorrect = true;

		Answer a2 = new Answer();
		a2.id = 2;
		a2.content = "tl java";
		a2.question = q3;
		a2.isCorrect = false;

		Answer a3 = new Answer();
		a3.id = 3;
		a3.content = "tl java";
		a3.question = q3;
		a3.isCorrect = false;

// in
		System.out.println("Department 1: ");
		System.out.println("	ID: " + dep1.id + " name: " + dep1.name);

		System.out.println("Position 1: ");
		System.out.println("	ID: " + pos1.id + " name: " + pos1.name);

		System.out.println("Account 1: ");
		System.out.println("	ID: " + acc1.id + ", email: " + acc1.email + ", UserName: " + acc1.userName
				+ ", FullName: " + acc1.fullName + ", department: " + acc1.department.name + ", position: "
				+ acc1.position.name + ", CreateDate: " + acc1.createDate + ", group: " + acc1.groups[0].name + " "
				+ acc1.groups[1].name);

		System.out.println("Question 1: ");
		System.out.println("	ID: " + q1.id + ", content: " + q1.content + ", category: " + q1.category.name
				+ ", type: " + q1.type.name + ", creator: " + q1.creator.fullName + ", CreateDate: " + q1.createDate
				+ ", exam: " + q1.exams[0].title + " " + q1.exams[1].title);

		System.out.println("Exam 1");
		System.out.println("	ID: " + ex1.id + " Code: " + ex1.code + " Title: " + ex1.title + " CategoryName: "
				+ ex1.category.name + " Duration: " + ex1.duration + " Creator: " + ex1.creator.fullName);

		System.out.println("CategoryQuestion: ");
		System.out.println("	ID: " + cq1.id + " Name: " + cq1.name);

		System.out.println("Answer: ");
		System.out.println("	ID: " + a1.id + " Content: " + a1.content + " Question: " + a1.question.content
				+ " IsCorrect: " + a1.isCorrect);

		System.out.println("TypeQuestion");
		System.out.println("	ID: " + tq1.id + " Name: " + tq1.name);

		System.out.println("Group1: ");
		System.out.println("	ID: " + g1.id + " Name: " + g1.name);
	}
}
