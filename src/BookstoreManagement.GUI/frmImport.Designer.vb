<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmImport
	Inherits System.Windows.Forms.Form

	'Form overrides dispose to clean up the component list.
	<System.Diagnostics.DebuggerNonUserCode()> _
	Protected Overrides Sub Dispose(ByVal disposing As Boolean)
		Try
			If disposing AndAlso components IsNot Nothing Then
				components.Dispose()
			End If
		Finally
			MyBase.Dispose(disposing)
		End Try
	End Sub

	'Required by the Windows Form Designer
	Private components As System.ComponentModel.IContainer

	'NOTE: The following procedure is required by the Windows Form Designer
	'It can be modified using the Windows Form Designer.  
	'Do not modify it using the code editor.
	<System.Diagnostics.DebuggerStepThrough()> _
	Private Sub InitializeComponent()
		Me.btnAdd = New System.Windows.Forms.Button()
		Me.dgvImport = New System.Windows.Forms.DataGridView()
		Me.colID = New System.Windows.Forms.DataGridViewTextBoxColumn()
		Me.colName = New System.Windows.Forms.DataGridViewTextBoxColumn()
		Me.colCategory = New System.Windows.Forms.DataGridViewTextBoxColumn()
		Me.colAuthor = New System.Windows.Forms.DataGridViewTextBoxColumn()
		Me.colAmount = New System.Windows.Forms.DataGridViewTextBoxColumn()
		Me.colPrice = New System.Windows.Forms.DataGridViewTextBoxColumn()
		Me.btnClear = New System.Windows.Forms.Button()
		Me.dtpReceivedDate = New System.Windows.Forms.DateTimePicker()
		Me.lblReceivedDate = New System.Windows.Forms.Label()
		CType(Me.dgvImport, System.ComponentModel.ISupportInitialize).BeginInit()
		Me.SuspendLayout()
		'
		'btnAdd
		'
		Me.btnAdd.Location = New System.Drawing.Point(236, 327)
		Me.btnAdd.Name = "btnAdd"
		Me.btnAdd.Size = New System.Drawing.Size(75, 23)
		Me.btnAdd.TabIndex = 0
		Me.btnAdd.Text = "Add"
		Me.btnAdd.UseVisualStyleBackColor = True
		'
		'dgvImport
		'
		Me.dgvImport.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
		Me.dgvImport.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.colID, Me.colName, Me.colCategory, Me.colAuthor, Me.colAmount, Me.colPrice})
		Me.dgvImport.Location = New System.Drawing.Point(91, 103)
		Me.dgvImport.Name = "dgvImport"
		Me.dgvImport.Size = New System.Drawing.Size(627, 199)
		Me.dgvImport.TabIndex = 1
		'
		'colID
		'
		Me.colID.HeaderText = "ID"
		Me.colID.MaxInputLength = 8
		Me.colID.Name = "colID"
		Me.colID.ReadOnly = True
		Me.colID.Width = 40
		'
		'colName
		'
		Me.colName.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill
		Me.colName.HeaderText = "Name"
		Me.colName.MaxInputLength = 30
		Me.colName.Name = "colName"
		'
		'colCategory
		'
		Me.colCategory.HeaderText = "Category"
		Me.colCategory.MaxInputLength = 10
		Me.colCategory.Name = "colCategory"
		'
		'colAuthor
		'
		Me.colAuthor.HeaderText = "Author"
		Me.colAuthor.MaxInputLength = 20
		Me.colAuthor.Name = "colAuthor"
		'
		'colAmount
		'
		Me.colAmount.HeaderText = "Amount"
		Me.colAmount.MaxInputLength = 10
		Me.colAmount.Name = "colAmount"
		'
		'colPrice
		'
		Me.colPrice.HeaderText = "Price"
		Me.colPrice.MaxInputLength = 10
		Me.colPrice.Name = "colPrice"
		'
		'btnClear
		'
		Me.btnClear.Location = New System.Drawing.Point(476, 327)
		Me.btnClear.Name = "btnClear"
		Me.btnClear.Size = New System.Drawing.Size(75, 23)
		Me.btnClear.TabIndex = 2
		Me.btnClear.Text = "Clear"
		Me.btnClear.UseVisualStyleBackColor = True
		'
		'dtpReceivedDate
		'
		Me.dtpReceivedDate.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
		Me.dtpReceivedDate.Location = New System.Drawing.Point(381, 54)
		Me.dtpReceivedDate.Name = "dtpReceivedDate"
		Me.dtpReceivedDate.Size = New System.Drawing.Size(95, 20)
		Me.dtpReceivedDate.TabIndex = 3
		'
		'lblReceivedDate
		'
		Me.lblReceivedDate.AutoSize = True
		Me.lblReceivedDate.Location = New System.Drawing.Point(288, 58)
		Me.lblReceivedDate.Name = "lblReceivedDate"
		Me.lblReceivedDate.Size = New System.Drawing.Size(79, 13)
		Me.lblReceivedDate.TabIndex = 4
		Me.lblReceivedDate.Text = "Received Date"
		'
		'frmImport
		'
		Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
		Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
		Me.ClientSize = New System.Drawing.Size(820, 391)
		Me.Controls.Add(Me.lblReceivedDate)
		Me.Controls.Add(Me.dtpReceivedDate)
		Me.Controls.Add(Me.btnClear)
		Me.Controls.Add(Me.dgvImport)
		Me.Controls.Add(Me.btnAdd)
		Me.Name = "frmImport"
		Me.ShowIcon = False
		Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
		Me.Text = "Import Book"
		CType(Me.dgvImport, System.ComponentModel.ISupportInitialize).EndInit()
		Me.ResumeLayout(False)
		Me.PerformLayout()

	End Sub

	Friend WithEvents btnAdd As Button
	Friend WithEvents dgvImport As DataGridView
	Friend WithEvents colID As DataGridViewTextBoxColumn
	Friend WithEvents colName As DataGridViewTextBoxColumn
	Friend WithEvents colCategory As DataGridViewTextBoxColumn
	Friend WithEvents colAuthor As DataGridViewTextBoxColumn
	Friend WithEvents colAmount As DataGridViewTextBoxColumn
	Friend WithEvents colPrice As DataGridViewTextBoxColumn
	Friend WithEvents btnClear As Button
	Friend WithEvents dtpReceivedDate As DateTimePicker
	Friend WithEvents lblReceivedDate As Label
End Class
