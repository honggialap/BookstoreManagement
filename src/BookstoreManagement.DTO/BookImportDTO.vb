Public Class BookImportDTO
	Private strID As String
	Private strName As String
	Private strCategory As String
	Private strAuthor As String
	Private intAmount As Integer
	Private intPrice As Integer
	Private dateReceivedDate As DateTime

	Public Sub New()
	End Sub

	Public Sub New(
		strID As String,
		strName As String,
		strCategory As String,
		strAuthor As String,
		intAmount As Integer,
		intPrice As Integer,
		dateReceivedDate As DateTime
		)

		Me.strID = strName
		Me.strName = strName
		Me.strCategory = strCategory
		Me.strAuthor = strAuthor
		Me.intAmount = intAmount
		Me.intPrice = intPrice
		Me.dateReceivedDate = dateReceivedDate
	End Sub

	Property ID() As String
		Get
			Return strID
		End Get
		Set(ByVal Value As String)
			strID = Value
		End Set
	End Property

	Property Name() As String
		Get
			Return strName
		End Get
		Set(ByVal Value As String)
			strName = Value
		End Set
	End Property

	Property Category() As String
		Get
			Return strCategory
		End Get
		Set(ByVal Value As String)
			strCategory = Value
		End Set
	End Property

	Property Author() As String
		Get
			Return strAuthor
		End Get
		Set(ByVal Value As String)
			strAuthor = Value
		End Set
	End Property

	Property Amount() As Integer
		Get
			Return intAmount
		End Get
		Set(ByVal Value As Integer)
			intAmount = Value
		End Set
	End Property

	Property Price() As Integer
		Get
			Return intPrice
		End Get
		Set(ByVal Value As Integer)
			intPrice = Value
		End Set
	End Property

	Property ReceivedDate() As DateTime
		Get
			Return dateReceivedDate
		End Get
		Set(ByVal Value As DateTime)
			dateReceivedDate = Value
		End Set
	End Property
End Class
