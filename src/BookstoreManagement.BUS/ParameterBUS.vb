Imports BookstoreManagement.DAL
Imports BookstoreManagement.DTO
Imports Utility

Public Class ParameterBUS
	Private parameterDAL As ParameterDAL

	Public Sub New()
		parameterDAL = New ParameterDAL()
	End Sub

	Public Sub New(connectionStr As String)
		parameterDAL = New ParameterDAL(connectionStr)
	End Sub

	Public Function selectAll(ByRef parameters As ParameterDTO) As Result
		' Validate here
		Return parameterDAL.selectAll(parameters)
	End Function
End Class
