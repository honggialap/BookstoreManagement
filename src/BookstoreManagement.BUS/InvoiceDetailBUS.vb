﻿Imports BookstoreManagement.DAL
Imports BookstoreManagement.DTO
Imports Utility

Public Class InvoiceDetailBUS
	Private invoiceDetailDAL As InvoiceDetailDAL

	Public Sub New()
		invoiceDetailDAL = New InvoiceDetailDAL()
	End Sub

	Public Sub New(connectionStr As String)
		invoiceDetailDAL = New InvoiceDetailDAL(connectionStr)
	End Sub

	Public Function getNextId(ByRef nextId As Integer) As Result
		Return invoiceDetailDAL.getNextId(nextId)
	End Function

	Public Function insert(invoiceDetail As InvoiceDetailDTO) As Result
		Return invoiceDetailDAL.insert(invoiceDetail)
	End Function

	Public Function insertAll(invoiceDetails As List(Of InvoiceDetailDTO)) As Result
		Return invoiceDetailDAL.insertAll(invoiceDetails)
	End Function

	Public Function sellectALL(ByRef invoiceDetails As List(Of InvoiceDetailDTO)) As Result
		Return invoiceDetailDAL.sellectALL(invoiceDetails)
	End Function

	Public Function sellectALL_ByInvoice(invoiceID As String, ByRef invoiceDetails As List(Of InvoiceDetailDTO)) As Result
		Return invoiceDetailDAL.sellectALL_ByInvoice(invoiceID, invoiceDetails)
	End Function

	Public Function sellectALL_ByBook(bookID As String, ByRef invoiceDetails As List(Of InvoiceDetailDTO)) As Result
		Return invoiceDetailDAL.sellectALL_ByBook(bookID, invoiceDetails)
	End Function

	Public Function update(invoiceDetail As InvoiceDetailDTO) As Result
		Return invoiceDetailDAL.update(invoiceDetail)
	End Function

	Public Function delete(invoiceDetailID As String) As Result
		Return invoiceDetailDAL.delete(invoiceDetailID)
	End Function
End Class