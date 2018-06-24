﻿Imports System.Configuration
Imports System.Data.SqlClient
Imports BookstoreManagement.DTO
Imports Utility

Public Class BookDAL
	Private connectionStr As String

	Public Sub New()
		connectionStr = ConfigurationManager.AppSettings("ConnectionStr")
	End Sub

	Public Sub New(connectionStr As String)
		Me.connectionStr = connectionStr
	End Sub

	Public Function getNextId(ByRef nextId As Integer) As Result
		Return New Result(True)
	End Function

	Public Function insert(book As BookDTO) As Result
		Return New Result(True)
	End Function

	Public Function sellectALL(ByRef books As List(Of BookDTO)) As Result
		Return New Result(True)
	End Function

	Public Function sellectALL_ByAuthor(authorID As String, ByRef books As List(Of BookDTO)) As Result
		Return New Result(True)
	End Function

	Public Function sellectALL_ByBookCategory(bookCategoryID As String, ByRef books As List(Of BookDTO)) As Result
		Return New Result(True)
	End Function

	Public Function update(book As BookDTO) As Result
		Return New Result(True)
	End Function

	Public Function delete(bookID As String) As Result
		Return New Result(True)
	End Function
End Class
