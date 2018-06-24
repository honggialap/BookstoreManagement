﻿Imports System.Configuration
Imports System.Data.SqlClient
Imports BookstoreManagement.DTO
Imports Utility

Public Class CustomerDAL
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

	Public Function insert(customer As CustomerDTO) As Result
		Return New Result(True)
	End Function

	Public Function sellectALL(ByRef customers As List(Of CustomerDTO)) As Result
		Return New Result(True)
	End Function

	Public Function update(customer As CustomerDTO) As Result
		Return New Result(True)
	End Function

	Public Function delete(customerID As String) As Result
		Return New Result(True)
	End Function
End Class
