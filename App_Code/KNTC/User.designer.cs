#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KNTC
{
	using System.Data.Linq;
	using System.Data.Linq.Mapping;
	using System.Data;
	using System.Collections.Generic;
	using System.Reflection;
	using System.Linq;
	using System.Linq.Expressions;
	using System.ComponentModel;
	using System;
	
	
	[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="HopKhongGiay")]
	public partial class UserDataContext : System.Data.Linq.DataContext
	{
		
		private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
		
    #region Extensibility Method Definitions
    partial void OnCreated();
    partial void InsertUser(User instance);
    partial void UpdateUser(User instance);
    partial void DeleteUser(User instance);
    #endregion
		
		public UserDataContext() : 
				base(global::System.Configuration.ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString, mappingSource)
		{
			OnCreated();
		}
		
		public UserDataContext(string connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public UserDataContext(System.Data.IDbConnection connection) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public UserDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public UserDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
				base(connection, mappingSource)
		{
			OnCreated();
		}
		
		public System.Data.Linq.Table<User> Users
		{
			get
			{
				return this.GetTable<User>();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.Users")]
	public partial class User : INotifyPropertyChanging, INotifyPropertyChanged
	{
		
		private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
		
		private int _UserID;
		
		private string _Username;
		
		private string _FirstName;
		
		private string _LastName;
		
		private bool _IsSuperUser;
		
		private System.Nullable<int> _AffiliateId;
		
		private string _Email;
		
		private string _DisplayName;
		
		private bool _UpdatePassword;
		
		private string _LastIPAddress;
		
		private bool _IsDeleted;
		
		private System.Nullable<int> _CreatedByUserID;
		
		private System.Nullable<System.DateTime> _CreatedOnDate;
		
		private System.Nullable<int> _LastModifiedByUserID;
		
		private System.Nullable<System.DateTime> _LastModifiedOnDate;
		
		private System.Nullable<System.Guid> _PasswordResetToken;
		
		private System.Nullable<System.DateTime> _PasswordResetExpiration;
		
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnUserIDChanging(int value);
    partial void OnUserIDChanged();
    partial void OnUsernameChanging(string value);
    partial void OnUsernameChanged();
    partial void OnFirstNameChanging(string value);
    partial void OnFirstNameChanged();
    partial void OnLastNameChanging(string value);
    partial void OnLastNameChanged();
    partial void OnIsSuperUserChanging(bool value);
    partial void OnIsSuperUserChanged();
    partial void OnAffiliateIdChanging(System.Nullable<int> value);
    partial void OnAffiliateIdChanged();
    partial void OnEmailChanging(string value);
    partial void OnEmailChanged();
    partial void OnDisplayNameChanging(string value);
    partial void OnDisplayNameChanged();
    partial void OnUpdatePasswordChanging(bool value);
    partial void OnUpdatePasswordChanged();
    partial void OnLastIPAddressChanging(string value);
    partial void OnLastIPAddressChanged();
    partial void OnIsDeletedChanging(bool value);
    partial void OnIsDeletedChanged();
    partial void OnCreatedByUserIDChanging(System.Nullable<int> value);
    partial void OnCreatedByUserIDChanged();
    partial void OnCreatedOnDateChanging(System.Nullable<System.DateTime> value);
    partial void OnCreatedOnDateChanged();
    partial void OnLastModifiedByUserIDChanging(System.Nullable<int> value);
    partial void OnLastModifiedByUserIDChanged();
    partial void OnLastModifiedOnDateChanging(System.Nullable<System.DateTime> value);
    partial void OnLastModifiedOnDateChanged();
    partial void OnPasswordResetTokenChanging(System.Nullable<System.Guid> value);
    partial void OnPasswordResetTokenChanged();
    partial void OnPasswordResetExpirationChanging(System.Nullable<System.DateTime> value);
    partial void OnPasswordResetExpirationChanged();
    #endregion
		
		public User()
		{
			OnCreated();
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_UserID", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
		public int UserID
		{
			get
			{
				return this._UserID;
			}
			set
			{
				if ((this._UserID != value))
				{
					this.OnUserIDChanging(value);
					this.SendPropertyChanging();
					this._UserID = value;
					this.SendPropertyChanged("UserID");
					this.OnUserIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Username", DbType="NVarChar(100) NOT NULL", CanBeNull=false)]
		public string Username
		{
			get
			{
				return this._Username;
			}
			set
			{
				if ((this._Username != value))
				{
					this.OnUsernameChanging(value);
					this.SendPropertyChanging();
					this._Username = value;
					this.SendPropertyChanged("Username");
					this.OnUsernameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_FirstName", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
		public string FirstName
		{
			get
			{
				return this._FirstName;
			}
			set
			{
				if ((this._FirstName != value))
				{
					this.OnFirstNameChanging(value);
					this.SendPropertyChanging();
					this._FirstName = value;
					this.SendPropertyChanged("FirstName");
					this.OnFirstNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_LastName", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
		public string LastName
		{
			get
			{
				return this._LastName;
			}
			set
			{
				if ((this._LastName != value))
				{
					this.OnLastNameChanging(value);
					this.SendPropertyChanging();
					this._LastName = value;
					this.SendPropertyChanged("LastName");
					this.OnLastNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IsSuperUser", DbType="Bit NOT NULL")]
		public bool IsSuperUser
		{
			get
			{
				return this._IsSuperUser;
			}
			set
			{
				if ((this._IsSuperUser != value))
				{
					this.OnIsSuperUserChanging(value);
					this.SendPropertyChanging();
					this._IsSuperUser = value;
					this.SendPropertyChanged("IsSuperUser");
					this.OnIsSuperUserChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AffiliateId", DbType="Int")]
		public System.Nullable<int> AffiliateId
		{
			get
			{
				return this._AffiliateId;
			}
			set
			{
				if ((this._AffiliateId != value))
				{
					this.OnAffiliateIdChanging(value);
					this.SendPropertyChanging();
					this._AffiliateId = value;
					this.SendPropertyChanged("AffiliateId");
					this.OnAffiliateIdChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Email", DbType="NVarChar(256)")]
		public string Email
		{
			get
			{
				return this._Email;
			}
			set
			{
				if ((this._Email != value))
				{
					this.OnEmailChanging(value);
					this.SendPropertyChanging();
					this._Email = value;
					this.SendPropertyChanged("Email");
					this.OnEmailChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DisplayName", DbType="NVarChar(128) NOT NULL", CanBeNull=false)]
		public string DisplayName
		{
			get
			{
				return this._DisplayName;
			}
			set
			{
				if ((this._DisplayName != value))
				{
					this.OnDisplayNameChanging(value);
					this.SendPropertyChanging();
					this._DisplayName = value;
					this.SendPropertyChanged("DisplayName");
					this.OnDisplayNameChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_UpdatePassword", DbType="Bit NOT NULL")]
		public bool UpdatePassword
		{
			get
			{
				return this._UpdatePassword;
			}
			set
			{
				if ((this._UpdatePassword != value))
				{
					this.OnUpdatePasswordChanging(value);
					this.SendPropertyChanging();
					this._UpdatePassword = value;
					this.SendPropertyChanged("UpdatePassword");
					this.OnUpdatePasswordChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_LastIPAddress", DbType="NVarChar(50)")]
		public string LastIPAddress
		{
			get
			{
				return this._LastIPAddress;
			}
			set
			{
				if ((this._LastIPAddress != value))
				{
					this.OnLastIPAddressChanging(value);
					this.SendPropertyChanging();
					this._LastIPAddress = value;
					this.SendPropertyChanged("LastIPAddress");
					this.OnLastIPAddressChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IsDeleted", DbType="Bit NOT NULL")]
		public bool IsDeleted
		{
			get
			{
				return this._IsDeleted;
			}
			set
			{
				if ((this._IsDeleted != value))
				{
					this.OnIsDeletedChanging(value);
					this.SendPropertyChanging();
					this._IsDeleted = value;
					this.SendPropertyChanged("IsDeleted");
					this.OnIsDeletedChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CreatedByUserID", DbType="Int")]
		public System.Nullable<int> CreatedByUserID
		{
			get
			{
				return this._CreatedByUserID;
			}
			set
			{
				if ((this._CreatedByUserID != value))
				{
					this.OnCreatedByUserIDChanging(value);
					this.SendPropertyChanging();
					this._CreatedByUserID = value;
					this.SendPropertyChanged("CreatedByUserID");
					this.OnCreatedByUserIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_CreatedOnDate", DbType="DateTime")]
		public System.Nullable<System.DateTime> CreatedOnDate
		{
			get
			{
				return this._CreatedOnDate;
			}
			set
			{
				if ((this._CreatedOnDate != value))
				{
					this.OnCreatedOnDateChanging(value);
					this.SendPropertyChanging();
					this._CreatedOnDate = value;
					this.SendPropertyChanged("CreatedOnDate");
					this.OnCreatedOnDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_LastModifiedByUserID", DbType="Int")]
		public System.Nullable<int> LastModifiedByUserID
		{
			get
			{
				return this._LastModifiedByUserID;
			}
			set
			{
				if ((this._LastModifiedByUserID != value))
				{
					this.OnLastModifiedByUserIDChanging(value);
					this.SendPropertyChanging();
					this._LastModifiedByUserID = value;
					this.SendPropertyChanged("LastModifiedByUserID");
					this.OnLastModifiedByUserIDChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_LastModifiedOnDate", DbType="DateTime")]
		public System.Nullable<System.DateTime> LastModifiedOnDate
		{
			get
			{
				return this._LastModifiedOnDate;
			}
			set
			{
				if ((this._LastModifiedOnDate != value))
				{
					this.OnLastModifiedOnDateChanging(value);
					this.SendPropertyChanging();
					this._LastModifiedOnDate = value;
					this.SendPropertyChanged("LastModifiedOnDate");
					this.OnLastModifiedOnDateChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_PasswordResetToken", DbType="UniqueIdentifier")]
		public System.Nullable<System.Guid> PasswordResetToken
		{
			get
			{
				return this._PasswordResetToken;
			}
			set
			{
				if ((this._PasswordResetToken != value))
				{
					this.OnPasswordResetTokenChanging(value);
					this.SendPropertyChanging();
					this._PasswordResetToken = value;
					this.SendPropertyChanged("PasswordResetToken");
					this.OnPasswordResetTokenChanged();
				}
			}
		}
		
		[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_PasswordResetExpiration", DbType="DateTime")]
		public System.Nullable<System.DateTime> PasswordResetExpiration
		{
			get
			{
				return this._PasswordResetExpiration;
			}
			set
			{
				if ((this._PasswordResetExpiration != value))
				{
					this.OnPasswordResetExpirationChanging(value);
					this.SendPropertyChanging();
					this._PasswordResetExpiration = value;
					this.SendPropertyChanged("PasswordResetExpiration");
					this.OnPasswordResetExpirationChanged();
				}
			}
		}
		
		public event PropertyChangingEventHandler PropertyChanging;
		
		public event PropertyChangedEventHandler PropertyChanged;
		
		protected virtual void SendPropertyChanging()
		{
			if ((this.PropertyChanging != null))
			{
				this.PropertyChanging(this, emptyChangingEventArgs);
			}
		}
		
		protected virtual void SendPropertyChanged(String propertyName)
		{
			if ((this.PropertyChanged != null))
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
			}
		}
	}
}
#pragma warning restore 1591
