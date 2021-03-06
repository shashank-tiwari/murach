/****** Object:  Table [dbo].[ContactUpdates]    Script Date: 5/2/2012 3:17:14 PM ******/
CREATE TABLE [dbo].[ContactUpdates](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[GLAccounts]    Script Date: 5/2/2012 3:17:14 PM ******/
CREATE TABLE [dbo].[GLAccounts](
	[AccountNo] [int] NOT NULL,
	[AccountDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GLAccounts] PRIMARY KEY CLUSTERED 
(
	[AccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[InvoiceArchive]    Script Date: 5/2/2012 3:17:14 PM ******/
CREATE TABLE [dbo].[InvoiceArchive](
	[InvoiceID] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[InvoiceNumber] [varchar](50) NOT NULL,
	[InvoiceDate] [smalldatetime] NOT NULL,
	[InvoiceTotal] [money] NOT NULL,
	[PaymentTotal] [money] NOT NULL,
	[CreditTotal] [money] NOT NULL,
	[TermsID] [int] NOT NULL,
	[InvoiceDueDate] [smalldatetime] NOT NULL,
	[PaymentDate] [smalldatetime] NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[InvoiceLineItems]    Script Date: 5/2/2012 3:17:14 PM ******/
CREATE TABLE [dbo].[InvoiceLineItems](
	[InvoiceID] [int] NOT NULL,
	[InvoiceSequence] [smallint] NOT NULL,
	[AccountNo] [int] NOT NULL,
	[InvoiceLineItemAmount] [money] NOT NULL,
	[InvoiceLineItemDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK_InvoiceLineItems] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC,
	[InvoiceSequence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Invoices]    Script Date: 5/2/2012 3:17:14 PM ******/
CREATE TABLE [dbo].[Invoices](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[VendorID] [int] NOT NULL,
	[InvoiceNumber] [varchar](50) NOT NULL,
	[InvoiceDate] [smalldatetime] NOT NULL,
	[InvoiceTotal] [money] NOT NULL,
	[PaymentTotal] [money] NOT NULL,
	[CreditTotal] [money] NOT NULL,
	[TermsID] [int] NOT NULL,
	[InvoiceDueDate] [smalldatetime] NOT NULL,
	[PaymentDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Terms]    Script Date: 5/2/2012 3:17:14 PM ******/
CREATE TABLE [dbo].[Terms](
	[TermsID] [int] IDENTITY(1,1) NOT NULL,
	[TermsDescription] [varchar](50) NOT NULL,
	[TermsDueDays] [smallint] NOT NULL,
 CONSTRAINT [PK_Terms] PRIMARY KEY CLUSTERED 
(
	[TermsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Vendors]    Script Date: 5/2/2012 3:17:14 PM ******/
CREATE TABLE [dbo].[Vendors](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](50) NOT NULL,
	[VendorAddress1] [varchar](50) NULL,
	[VendorAddress2] [varchar](50) NULL,
	[VendorCity] [varchar](50) NOT NULL,
	[VendorState] [char](2) NOT NULL,
	[VendorZipCode] [varchar](20) NOT NULL,
	[VendorPhone] [varchar](50) NULL,
	[VendorContactLName] [varchar](50) NULL,
	[VendorContactFName] [varchar](50) NULL,
	[DefaultTermsID] [int] NOT NULL,
	[DefaultAccountNo] [int] NOT NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Index [IX_InvoiceLineItems_AccountNo]    Script Date: 5/2/2012 3:17:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_InvoiceLineItems_AccountNo] ON [dbo].[InvoiceLineItems]
(
	[AccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_InvoiceDate]    Script Date: 5/2/2012 3:17:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_InvoiceDate] ON [dbo].[Invoices]
(
	[InvoiceDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Invoices_TermsID]    Script Date: 5/2/2012 3:17:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Invoices_TermsID] ON [dbo].[Invoices]
(
	[TermsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Invoices_VendorID]    Script Date: 5/2/2012 3:17:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Invoices_VendorID] ON [dbo].[Invoices]
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [IX_VendorName]    Script Date: 5/2/2012 3:17:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_VendorName] ON [dbo].[Vendors]
(
	[VendorName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Vendors_AccountNo]    Script Date: 5/2/2012 3:17:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Vendors_AccountNo] ON [dbo].[Vendors]
(
	[DefaultAccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Vendors_TermsID]    Script Date: 5/2/2012 3:17:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Vendors_TermsID] ON [dbo].[Vendors]
(
	[DefaultTermsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Invoices] ADD  CONSTRAINT [DF_Invoices_PaymentTotal]  DEFAULT (0) FOR [PaymentTotal]
GO
ALTER TABLE [dbo].[Invoices] ADD  CONSTRAINT [DF_Invoices_CreditTotal]  DEFAULT (0) FOR [CreditTotal]
GO
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [DF_Vendors_TermsID]  DEFAULT (3) FOR [DefaultTermsID]
GO
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [DF_Vendors_AccountNo]  DEFAULT (570) FOR [DefaultAccountNo]
GO
ALTER TABLE [dbo].[InvoiceLineItems]  ADD  CONSTRAINT [FK_InvoiceLineItems_GLAccounts] FOREIGN KEY([AccountNo])
REFERENCES [dbo].[GLAccounts] ([AccountNo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InvoiceLineItems] CHECK CONSTRAINT [FK_InvoiceLineItems_GLAccounts]
GO
ALTER TABLE [dbo].[InvoiceLineItems]  ADD  CONSTRAINT [FK_InvoiceLineItems_Invoices] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoices] ([InvoiceID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InvoiceLineItems] CHECK CONSTRAINT [FK_InvoiceLineItems_Invoices]
GO
ALTER TABLE [dbo].[Invoices]  ADD  CONSTRAINT [FK_Invoices_Terms] FOREIGN KEY([TermsID])
REFERENCES [dbo].[Terms] ([TermsID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Terms]
GO
ALTER TABLE [dbo].[Invoices]  ADD  CONSTRAINT [FK_Invoices_Vendors] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Vendors]
GO
ALTER TABLE [dbo].[Vendors]  ADD  CONSTRAINT [FK_Vendors_GLAccounts] FOREIGN KEY([DefaultAccountNo])
REFERENCES [dbo].[GLAccounts] ([AccountNo])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [FK_Vendors_GLAccounts]
GO
ALTER TABLE [dbo].[Vendors]  ADD  CONSTRAINT [FK_Vendors_Terms] FOREIGN KEY([DefaultTermsID])
REFERENCES [dbo].[Terms] ([TermsID])
GO
ALTER TABLE [dbo].[Vendors] CHECK CONSTRAINT [FK_Vendors_Terms]
GO