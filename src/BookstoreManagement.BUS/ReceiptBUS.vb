﻿Imports BookstoreManagement.DAL
Imports BookstoreManagement.DTO
Imports Utility

Public Class ReceiptBUS
	Private receiptDAL As ReceiptDAL

	Public Sub New()
		receiptDAL = New ReceiptDAL()
	End Sub

	Public Sub New(connectionStr As String)
		receiptDAL = New ReceiptDAL(connectionStr)
	End Sub

	Public Function getNextId(ByRef nextId As Integer) As Result
		Return getNextId(nextId)
	End Function

	Public Function insert(receipt As ReceiptDTO) As Result
		Return insert(receipt)
	End Function

	Public Function selectALL(ByRef receipts As List(Of ReceiptDTO)) As Result
		Return selectALL(receipts)
	End Function

	Public Function selectALL_ByDate(dateCollected As DateTime, ByRef receipts As List(Of ReceiptDTO)) As Result
		Return selectALL_ByDate(dateCollected, receipts)
	End Function
	Public Function selectALL_ByCustomer(customerID As String, ByRef receipts As List(Of ReceiptDTO)) As Result
		Return selectALL_ByCustomer(customerID, receipts)
	End Function

	Public Function update(receipt As ReceiptDTO) As Result
		Return update(receipt)
	End Function

	Public Function delete(receiptID As String) As Result
		Return delete(receiptID)
	End Function
End Class
