<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DsDanToc.ascx.cs" Inherits="KNTC.DsDanToc" %>
<%@ Register TagPrefix="dnnsc" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%--<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>--%>

<script type="text/javascript" src="<%=vPathCommonJS %>"></script>
<dnn:DnnJsInclude ID="Chosen" runat="server" FilePath="/DesktopModules/KNTC/Scripts/search.js" AddTag="false" />

<script type="text/javascript">

    function pageLoad(sender, args) {
        initSearch();
    }
</script>
<asp:UpdatePanel runat="server" ID="updatePN">
    <ContentTemplate>
        <asp:Panel ID="pnl" runat="server" DefaultButton="buttonSearch">
            <section class="content ">
                <div class="container-fluid">
                    <div class="card card-table-master">
                        <div class="card-header sticky">
                            <h3 class="card-title">Danh sách dân tộc</h3>
                            <div class="card-filter">
                                <!-- Text search -->
                                <div class="input-group input-group tool-right">
                                    <asp:Literal runat="server" ID="Literal_OptionSearch">
                            <div class="float-right OptionSearch OptionSearchDisplay"  data-save="false"></div>
                                    </asp:Literal>
                                    <asp:TextBox runat="server" ID="textSearchContent_HiddenField" CssClass="form-control float-right textSearchContent_HiddenField" placeholder="Nhập từ khóa tìm kiếm" Style="min-width: 100px; display: none"></asp:TextBox>
                                    <asp:TextBox runat="server" ID="textSearchContent" CssClass="form-control float-right" placeholder="Nhập từ khóa tìm kiếm" Style="min-width: 100px;"></asp:TextBox>

                                    <div class="input-group-append d-none filter-toggler">
                                        <button class="navbar-toggler btn btn-default btn-flat" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                                            <i class="icofont-filter"></i>
                                        </button>
                                    </div>
                                    <div class="input-group-append ">
                                        <asp:LinkButton ID="buttonSearch" runat="server" CssClass="btn btn-default btn-flat" OnClick="btnSearch_Click"> <i class="fas fa-search"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="card-tools">
                                <div class="tool-right">
                                    <div class="card-filter-advance">
                                        <nav class="navbar navbar-expand-lg ">
                                            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                                                <ul class="navbar-nav">
                                                    <li class="nav-item dropdown dropdown-filter">
                                                        <button type="button" class="btn btn-tool dropdown-toggle" aria-expanded="false" data-toggle="dropdown">
                                                            <i class="icofont-filter"></i>Bộ lọc
                                                        </button>
                                                        <div class="dropdown-menu dropdown-menu-right" role="menu" style="">
                                                            <a href="#" class="dropdown-item" data-option="DANTOC.DANTOC_TEN" data-type="normal" data-title="Mã đơn vị"><i class="icofont-check"></i>Tên dân tộc</a>
                                                            <a href="#" class="dropdown-item" data-option="DANTOC.DANTOC_MOTA" data-type="normal"><i class="icofont-check"></i>Mô tả</a>                                                            
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </nav>
                                    </div>
                                 <%-- <div class="card-list-type">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default btn-sm btn-flat"><i class="fa fa-th-large" aria-hidden="true"></i></button>
                                            <button type="button" class="btn btn-default btn-sm btn-flat active "><i class="fa fa-list" aria-hidden="true"></i></button>
                                            <button type="button" class="btn btn-default btn-sm btn-flat"><i class="fa fa-th" aria-hidden="true"></i></button>
                                        </div>
                                    </div>--%>
                                    <div class="card-pagination">
                                        <div class="btn-group tool-right pagination-group">
                                            <span class="pagination-title">
                                                <asp:TextBox runat="server" ID="txtRecordStartEnd" AutoPostBack="true" OnTextChanged="txtRecordStartEnd_TextChanged" CssClass="form-control float-left text-right" Width="50" placeholder=""></asp:TextBox>
                                                /
                                            <asp:Label runat="server" ID="lblTotalRecords" Text="" />
                                            </span>

                                            <asp:LinkButton ID="LinkButtonPrevious" runat="server" CssClass="btn btn-default btn-sm btn-flat" OnClick="LinkButtonPrevious_Click">&lt;</asp:LinkButton>
                                            <asp:LinkButton ID="LinkButtonLast" runat="server" CssClass="btn btn-default btn-sm btn-flat" OnClick="LinkButtonLast_Click">&gt;</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                                <!--<div class="tool-right">
                                </div>-->
                                <div class="tool-left">
                                    <asp:LinkButton ID="btn_ThemMoi" runat="server" OnClick="btnThemMoi_Click" CssClass="btn  bg-gradient-primary btn-flat tool-left"><i class="icofont-plus"></i> THÊM MỚI</asp:LinkButton>
                                    <asp:LinkButton ID="btn_Nhap" Visible="false" runat="server" OnClick="btnThemMoi_Click" CssClass="btn btn-default btn-flat tool-left text-primary"><i class="icofont-upload"></i> NHẬP</asp:LinkButton>
                                    <%--<asp:LinkButton ID="btn_Xoa" OnClientClick="return getConfirmation(this, 'THÔNG BÁO','Bạn chắc chắn muốn xóa dữ liệu đã chọn?');" CausesValidation="false" runat="server" CssClass="btn btn-default btn-flat tool-left text-primary " OnClick="btn_Xoa_Click" Style="display: none;"><i class=""></i> Xóa</asp:LinkButton>--%>
                                    <div id="divShowBtnXoa" style="display: none;" class="fleft">
                                        <button type="button" class="btn btn-default btn-flat tool-left text-primary  btn-warning-delete " onclick="confirm_delete_rows('<%=btn_Xoa.ClientID%>')"><i class="icofont-ui-delete"></i>Xóa</button>
                                    </div>
                                    <div style="display: none;">
                                        <asp:LinkButton ID="btn_Xoa" CausesValidation="false" Visible="true" runat="server" CssClass="btn btn-default btn-flat tool-left text-primary  btn min-width-100 mr-t3 mr-b3" OnClick="btn_Xoa_Click"><i class=""></i> Xóa</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body p-0">
                            <!--style="height: 500px;"-->
                            <div class="table-content p-0">
                                <asp:DataGrid DataKeyField="DANTOC_ID" runat="server" ID="dgDanhSach" AutoGenerateColumns="False" BorderWidth="0" AutoPostback="True"
                                    AllowSorting="True" OnSortCommand="dgDanhSach_SortCommand" OnItemDataBound="dgDanhSach_ItemDataBound" CssClass="table vertical-align-middle">
                                    <%--text-nowrap--%>
                                    <HeaderStyle CssClass="table-header" />
                                    <Columns>
                                        <asp:TemplateColumn Visible="true" HeaderStyle-CssClass="sticky">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkAll" runat="server" onclick="handle_checked_delete_all_rows(this,'divShowBtnXoa');" />
                                            </HeaderTemplate>
                                            <HeaderStyle Width="3%" />
                                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                Font-Underline="False" Width="3%" />
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkRow" runat="server" onclick="handle_checked_delete_row(this,'divShowBtnXoa');" />
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn HeaderText="DANTOC_ID" DataField="DANTOC_ID" Visible="false" HeaderStyle-CssClass="sticky">
                                            <ItemStyle HorizontalAlign="Left" />
                                            <HeaderStyle />
                                        </asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="Tên dân tộc" ItemStyle-Width="50%" HeaderStyle-HorizontalAlign="Left" SortExpression="DANTOC_TEN" HeaderStyle-CssClass="sticky">
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <a onserverclick="dgDanhSach_Sua" title="Cập nhật đơn vị" href='<%# Eval("DANTOC_ID").ToString() %>' oncontextmenu="return false" runat="server"><%# DataBinder.Eval(Container, "DataItem.DANTOC_TEN") %></a>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>                                         

                                        <asp:TemplateColumn HeaderText="Mô tả" ItemStyle-Width="32%" HeaderStyle-HorizontalAlign="Left" SortExpression="DANTOC_MOTA" HeaderStyle-CssClass="sticky">
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <%# Eval("DANTOC_MOTA") %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>                                   
                                    </Columns>
                                    <PagerStyle Mode="NumericPages" CssClass="paping" PageButtonCount="9999" Visible="false"></PagerStyle>
                                </asp:DataGrid>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
            </section>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>

<style>
    .form .form-inline .col-left {
        float: left;
    }

    .danhsach table tbody tr.paping td select {
        float: right;
    }
</style>
<script type="text/javascript">
    function getConfirmation(sender, title, message) {
        $("#spnTitle").text(title);
        $("#spnMsg").text(message);
        $('#modalPopUp').modal('show');
        $('#btnConfirm').attr('onclick', "$('#modalPopUp').modal('hide');setTimeout(function(){" + $(sender).prop('href') + "}, 50);");
        return false;
    }
    function ConfirmDelete() {
        return confirm("Bạn muốn xóa dữ liệu này ?");
    }
    function ConfirmActive() {
        return confirm("Bạn muốn thay đổi trạng thái quốc gia?");
    }
    function ConfirmDelete() {
        return confirm("Bạn muốn xóa dữ liệu này ?");
    }     
</script>
