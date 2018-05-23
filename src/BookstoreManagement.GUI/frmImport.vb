Imports BookstoreManagement.BUS
Imports BookstoreManagement.DTO
Imports Utility

Public Class frmImport
	Private bookImportBUS As BookImportBUS

	Private Sub frmImport_Load(sender As Object, e As EventArgs) Handles MyBase.Load
		bookImportBUS = New BookImportBUS()

		Dim nextId As Integer
		Dim result As Result

		result = bookImportBUS.getNextId(nextId)

		If (result.FlagResult = True) Then
			dgvImport.Rows.Add({nextId.ToString(), Nothing, Nothing, Nothing, Nothing, Nothing})
		Else
			MessageBox.Show("Cannot get the next reader ID", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
			Console.WriteLine(result.SystemMessage)
		End If
	End Sub

	Private Sub btnAdd_Click(sender As Object, e As EventArgs) Handles btnAdd.Click
		Dim importInfos = New List(Of BookImportDTO)

		For Each row As DataGridViewRow In dgvImport.Rows
			If (row.IsNewRow) Then
				Exit For
			End If

			Dim importInfo As BookImportDTO = New BookImportDTO()

			importInfo.ID = row.Cells("colID").Value
			importInfo.Name = row.Cells("colName").Value
			importInfo.Category = row.Cells("colCategory").Value
			importInfo.Author = row.Cells("colAuthor").Value
			importInfo.Amount = row.Cells("colAmount").Value
			importInfo.Price = row.Cells("colPrice").Value
			importInfo.ReceivedDate = dtpReceivedDate.Value

			importInfos.Add(importInfo)
		Next

		Dim result As Result

		result = bookImportBUS.insert(importInfos)

		If (result.FlagResult = True) Then
			MessageBox.Show("Books added to import list", "Status", MessageBoxButtons.OK, MessageBoxIcon.Information)
		Else
			MessageBox.Show("Books added failed failed", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
			Console.WriteLine(result.SystemMessage)
		End If

	End Sub

	Private Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
		dgvImport.Rows.Clear()
		dgvImport.Refresh()

		Dim nextId As Integer
		Dim result As Result

		result = bookImportBUS.getNextId(nextId)

		If (result.FlagResult = True) Then
			dgvImport.Rows.Add({nextId.ToString(), Nothing, Nothing, Nothing, Nothing, Nothing})
		Else
			MessageBox.Show("Cannot get the next reader ID", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
			Console.WriteLine(result.SystemMessage)
		End If
	End Sub
End Class
