Imports BookstoreManagement.DAL
Imports BookstoreManagement.DTO
Imports Utility

Public Class StockReportDetailBUS
	Private stockReportDetailDAL As StockReportDetailDAL

	Public Sub New()
		stockReportDetailDAL = New StockReportDetailDAL()
	End Sub

	Public Sub New(connectionStr As String)
		stockReportDetailDAL = New StockReportDetailDAL(connectionStr)
	End Sub

	Public Function getNextId(ByRef nextId As Integer) As Result
		Return getNextId(nextId)
	End Function

	Public Function insert(stockReportDetail As StockReportDetailDTO) As Result
		Return insert(stockReportDetail)
	End Function

	Public Function insertAll(stockReportDetails As List(Of StockReportDetailDTO)) As Result
		Return insertAll(stockReportDetails)
	End Function

	Public Function selectALL(ByRef stockReportDetails As List(Of StockReportDetailDTO)) As Result
		Return selectALL(stockReportDetails)
	End Function

	Public Function selectALL_ByStockReport(stockReportID As String, ByRef stockReportDetails As List(Of StockReportDetailDTO)) As Result
		Return selectALL_ByStockReport(stockReportID, stockReportDetails)
	End Function

	Public Function selectALL_ByBook(bookID As String, ByRef stockReportDetails As List(Of StockReportDetailDTO)) As Result
		Return selectALL_ByBook(bookID, stockReportDetails)
	End Function

	Public Function update(stockReportDetail As StockReportDetailDTO) As Result
		Return update(stockReportDetail)
	End Function

	Public Function delete(stockReportDetailID As String) As Result
		Return delete(stockReportDetailID)
	End Function
End Class
