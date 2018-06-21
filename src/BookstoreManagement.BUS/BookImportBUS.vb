Imports BookstoreManagement.DAL
Imports BookstoreManagement.DTO
Imports Utility

Public Class BookImportBUS
	Private bookImportDAL As BookImportDAL
	Private parameterBUS As ParameterBUS

	Public Sub New()
		bookImportDAL = New BookImportDAL()
		parameterBUS = New ParameterBUS()
	End Sub

	Public Sub New(connectionStr As String)
		bookImportDAL = New BookImportDAL(connectionStr)
		parameterBUS = New ParameterBUS()
	End Sub

	Public Function isValidBookImportInfo(importInfo As BookImportDTO)
		If (importInfo.Name.Length < 1) Then
			Return False
		End If

		Dim parameter As ParameterDTO
		Dim result = parameterBUS.selectAll(parameter)

		If result.FlagResult = True Then
			If (importInfo.Amount < parameter.MinImportAmount) Then
				Return False
			End If

			' TODO: Check if number of books in inventory is small enough

			Return True
		End If
		Return False
	End Function

	Public Function insert(importInfos As List(Of BookImportDTO)) As Result
		' Validate here
		Dim result As Result

		For Each importInfo As BookImportDTO In importInfos
			result = bookImportDAL.insert(importInfo)

			If (result.FlagResult <> True) Then
				Return result
			End If
		Next

		Return result
	End Function

	Public Function insert(importInfo As BookImportDTO) As Result
		' Validate here
		Return bookImportDAL.insert(importInfo)
	End Function

	Public Function getNextId(ByRef nextId As Integer) As Result
		Return bookImportDAL.getNextId(nextId)
	End Function
End Class
