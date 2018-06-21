Public Class ParameterDTO
	Private intMinImportAmount As Integer
	Private intMinInventoryAmount As Integer

	Public Sub New()
	End Sub

	Public Sub New(
		intMinImportAmount As Integer,
		intMinInventoryAmount As Integer
		)

		Me.intMinImportAmount = intMinImportAmount
		Me.intMinInventoryAmount = intMinInventoryAmount
	End Sub

	Property MinImportAmount() As Integer
		Get
			Return intMinImportAmount
		End Get
		Set(ByVal Value As Integer)
			intMinImportAmount = Value
		End Set
	End Property

	Property MinInventoryAmount() As Integer
		Get
			Return intMinInventoryAmount
		End Get
		Set(ByVal Value As Integer)
			intMinInventoryAmount = Value
		End Set
	End Property
End Class
