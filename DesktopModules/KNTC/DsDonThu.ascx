<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DsDonThu.ascx.cs" Inherits="KNTC.DsDonThu" %>
<%@ Register TagPrefix="dnnsc" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%--<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>--%>
<script type="text/javascript" src="<%=vPathCommonJS %>"></script>
<dnn:DnnJsInclude ID="Chosen" runat="server" FilePath="/DesktopModules/KNTC/Scripts/search.js" AddTag="false" />
<script type="text/javascript">

    function pageLoad(sender, args) {
        initSearch();
        $('.datepicker').datetimepicker({
            format: 'L'
        });
    }
</script>
<asp:UpdateProgress ID="prgLoadingStatus" runat="server" DynamicLayout="true">
    <ProgressTemplate>
       <%-- <div id="overlay">
            <div id="modalprogress">
                <asp:Image ID="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/DesktopModules/HOPKHONGGIAY/Images/ajax-loader.gif" />
            </div>
        </div>--%>
    </ProgressTemplate>
</asp:UpdateProgress>
<div class="float-right OptionSearch OptionSearchSave" style="display: none;"></div>

<asp:UpdatePanel runat="server" ID="updatePN">
    <ContentTemplate>
        <asp:Panel ID="pnl" runat="server" DefaultButton="buttonSearch">
            <section class="content ">
                <div class="container-fluid">
                    <div class="card card-table-master">
                        <div class="card-header sticky">
                            <h3 class="card-title">Đơn thư</h3>
                            <div class="card-filter">
                                <!-- Text search -->
                                <div class="input-group input-group tool-right">
                                    <asp:Literal runat="server" ID="Literal_OptionSearch">
                            <div class="float-right OptionSearch OptionSearchDisplay"  data-save="false"></div>
                                    </asp:Literal>
                                    <asp:TextBox runat="server" ID="textSearchContent_HiddenField" CssClass="form-control float-right textSearchContent_HiddenField" placeholder="Nhập từ khóa tìm kiếm" Style="min-width: 100px;"></asp:TextBox>
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
                                                            <a href="#" class="dropdown-item" data-option="DONTHU.DONTHU_STT" data-type="normal" data-title="Số thứ tự đơn thư"><i class="icofont-check"></i>Số thứ tự đơn thư</a>
                                                            <a href="#" class="dropdown-item" data-option="CANHAN.CANHAN_HOTEN" data-type="normal"><i class="icofont-check"></i>Họ tên</a>
                                                            <a href="#" class="dropdown-item" data-option="CANHAN.CANHAN_DIACHI_DAYDU" data-type="normal"><i class="icofont-check"></i>Địa chỉ</a>
                                                            <a href="#" class="dropdown-item" data-option="DONTHU.DONTHU_NOIDUNG" data-type="normal"><i class="icofont-check"></i>Nội dung</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a href="#" class="dropdown-item" data-option="DONTHU.NGAYTAO" data-type="datetime"><i class="icofont-check"></i>Ngày nhận đơn</a>
                                                            <div class="datetime-content" data-option="DONTHU.NGAYTAO"></div>
                                                            <a href="#" class="dropdown-item" data-option="DONTHU.NGUONDON_NGAYDEDON" data-type="datetime"><i class="icofont-check"></i>Ngày đề đơn</a>
                                                            <div class="datetime-content" data-option="DONTHU.NGUONDON_NGAYDEDON"></div>
                                                        </div>
                                                    </li>

                                                    <li class="nav-item dropdown dropdown-filter">
                                                        <button type="button" class="btn btn-tool dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                            <i class="icofont-checked"></i>Trạng thái
                                                        </button>
                                                        <div class="dropdown-menu dropdown-menu-right" role="menu" style="">
                                                            <a href="#" class="dropdown-item" data-option="DONTHU.DONTHU_TRANGTHAI " data-type="equal" data-value="= 0"><i class="icofont-check"></i>Chưa xử lý</a>
                                                            <a href="#" class="dropdown-item" data-option="DONTHU.DONTHU_TRANGTHAI" data-type="equal" data-value="= 1"><i class="icofont-check"></i>Đã có hướng xử lý</a>
                                                            <a href="#" class="dropdown-item" data-option="DONTHU.DONTHU_TRANGTHAI" data-type="equal" data-value="= 4"><i class="icofont-check"></i>Kết thúc đơn</a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </nav>
                                    </div>
                                    <div class="card-list-type">                                  
                                    </div>
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

                            <%--</div>--%>                                                 
                                <div class="tool-left">
                                    <asp:LinkButton ID="btn_ThemMoi" runat="server" OnClick="btnThemMoi_Click" CssClass="btn  bg-gradient-primary btn-flat tool-left"><i class="icofont-plus"></i> THÊM MỚI</asp:LinkButton>

                                    <asp:LinkButton ID="btn_Nhap" Visible="false" runat="server" OnClick="btnThemMoi_Click" CssClass="btn btn-default btn-flat tool-left text-primary"><i class="icofont-upload"></i> NHẬP</asp:LinkButton>

                                    <%--<asp:LinkButton ID="btn_Xoa" OnClientClick="return getConfirmation(this, 'THÔNG BÁO','Bạn chắc chắn muốn xóa dữ liệu đã chọn?');" CausesValidation="false" runat="server" CssClass="btn btn-default btn-flat tool-left text-primary " OnClick="btn_Xoa_Click" Style="display: none;"><i class=""></i> Xóa</asp:LinkButton>--%>
                                    <div id="divShowBtnXoa" style="display: none;">
                                        <asp:LinkButton ID="buttonGiaiQuyet" Visible="false" runat="server" OnClick="buttonGiaiQuyet_Click" CssClass="btn  bg-gradient-primary btn-flat tool-left"><i class="icofont-law-document"></i> GIẢI QUYẾT ĐƠN</asp:LinkButton>                         
                                        <button type="button" class="btn btn-default btn-flat tool-left text-primary  btn-warning-delete " onclick="confirm_delete_rows('<%=btn_Xoa.ClientID%>')"><i class="icofont-ui-delete"></i> Xóa</button>
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
                                <asp:DataGrid DataKeyField="DONTHU_ID" runat="server" ID="dgDanhSach" AutoGenerateColumns="False" BorderWidth="0"
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
                                        <asp:BoundColumn HeaderText="DONTHU_ID" DataField="DONTHU_ID" Visible="false" HeaderStyle-CssClass="sticky">
                                            <ItemStyle HorizontalAlign="Left" />
                                            <HeaderStyle />
                                        </asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="STT" HeaderStyle-HorizontalAlign="Center" SortExpression="DONTHU_STT" HeaderStyle-CssClass="sticky">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <a onserverclick="dgDanhSach_Sua" title="Cập nhật thông tin đơn thư" href='<%# Eval("DONTHU_ID").ToString() %>' runat="server"><%# DataBinder.Eval(Container, "DataItem.DONTHU_STT") %></a>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn HeaderText="Tên chủ đơn" HeaderStyle-HorizontalAlign="Left" HeaderStyle-CssClass="sticky" ItemStyle-Width="25%">
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <a onserverclick="dgDanhSach_Sua" title="Cập nhật thông tin đơn thư" href='<%# Eval("DONTHU_ID").ToString() %>' runat="server">                                              

                                                    <%# getThongTinDoiTuong(int.Parse(Eval("DOITUONG_ID").ToString())) %>  </a>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="Nguồn đơn" HeaderStyle-HorizontalAlign="Left" SortExpression="NGUONDON_LOAI_CHITIET" HeaderStyle-CssClass="sticky">
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <%# Eval("NGUONDON_LOAI_CHITIET").ToString() == "0"?"Trực tiếp":Eval("NGUONDON_LOAI_CHITIET").ToString() == "1"?"Bưu chính":Eval("NGUONDON_LOAI_CHITIET").ToString() == "3"?"Họp thư góp ý":GetCoQuanChuyenDon(Eval("NGUONDON_DONVI_ID").ToString()) %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn HeaderText="Loại đơn" HeaderStyle-HorizontalAlign="Left" SortExpression="LOAIDONTHU_ID" HeaderStyle-CssClass="sticky">
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <%#GetTenLoaiDonThuById(DataBinder.Eval(Container, "DataItem.LOAIDONTHU_CHA_ID").ToString()) %>
                                                <%--<%#  Eval("DOITUONG_LOAI").ToString()=="1"?"Cá Nhân":(Eval("DOITUONG_LOAI").ToString()=="2"?"Nhóm đông người":Eval("DOITUONG_TEN").ToString()) %>--%>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="Nội dung vụ việc" HeaderStyle-HorizontalAlign="Left" SortExpression="DONTHU_NOIDUNG" HeaderStyle-CssClass="sticky">
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container, "DataItem.DONTHU_NOIDUNG") %>                                              
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <%--<asp:TemplateColumn HeaderText="Tình trạng" HeaderStyle-HorizontalAlign="Left" SortExpression="TinhTrang" HeaderStyle-CssClass="sticky">
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <%# Eval("TRANGTHAI_DONTHUKHONGDUDIEUKIEN").ToString()=="True" ?"Lưu đơn":
                                                    Eval("HUONGXULY_ID")== null?"Chưa xử lý":
                                                    Eval("HUONGXULY_ID").ToString() =="0"?"Chưa xử lý":
                                                    Eval("HUONGXULY_ID").ToString() =="1"?"Đang xử lý":
                                                    Eval("HUONGXULY_ID").ToString() =="2"?"Đơn thư kết thúc":
                                                    Eval("HUONGXULY_ID").ToString() =="3"?"Đang xử lý":
                                                    Eval("HUONGXULY_ID").ToString() =="4"?"Đang xử lý":
                                                    Eval("HUONGXULY_ID").ToString() =="5"?"Đang xử lý":
                                                    Eval("HUONGXULY_ID").ToString() =="6"?"Đơn thư kết thúc":
                                                    Eval("HUONGXULY_ID").ToString() =="7"?"Đơn thư kết thúc":
                                                    Eval("HUONGXULY_ID").ToString() =="8"?"Đơn thư kết thúc":
                                                    Eval("HUONGXULY_ID").ToString() =="9"?"Đơn thư kết thúc":
                                                    Eval("HUONGXULY_ID").ToString() =="10"?"Đang xử lý":"Chưa xử lý" %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>--%>

                                        <asp:TemplateColumn HeaderText="Tình trạng" HeaderStyle-HorizontalAlign="Left"  HeaderStyle-CssClass="sticky">
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                    <%# Eval("DONTHU_TRANGTHAI").ToString() =="0"?"Chưa xử lý":
                                                    (Eval("DONTHU_TRANGTHAI").ToString() =="1"?"Đã có hướng xử lý":
                                                    (Eval("DONTHU_TRANGTHAI").ToString() =="2"?"Chưa có kết quả giải quyết":
                                                    (Eval("DONTHU_TRANGTHAI").ToString() =="3"?"Đã có kết quả giải quyết":"Đơn thư đã kết thúc"))) %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="Hướng/Nội dung xử lý" HeaderStyle-HorizontalAlign="Left" SortExpression="DONTHU_NOIDUNG" HeaderStyle-CssClass="sticky">
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <%#Eval("TRANGTHAI_DONTHUKHONGDUDIEUKIEN").ToString()=="True" ?"": DataBinder.Eval(Container, "DataItem.HUONGXULY_ID") != null ? 
                                                    ("<b>" +   Eval("HUONGXULY_TEN").ToString() + "</b> <br/>" +  Eval("HUONGXULY_YKIEN_XULY").ToString())
                                                    :
                                                    ""%>
                                                <a onserverclick="dgDanhSach_XuatPhieu" class="" id="DanhSach_XuatPhieu"  title="Kết xuất phiếu đơn thư" href='<%# Eval("DONTHU_ID").ToString() %>' oncontextmenu="return false" runat="server">
                                                <%# DataBinder.Eval(Container, "DataItem.HUONGXULY_ID") != null? (Eval("HUONGXULY_ID").ToString()=="2"||Eval("HUONGXULY_ID").ToString()=="3"||Eval("HUONGXULY_ID").ToString()=="1"||Eval("HUONGXULY_ID").ToString()=="7" ||Eval("HUONGXULY_ID").ToString()=="5" ||Eval("HUONGXULY_ID").ToString()=="8" ||Eval("HUONGXULY_ID").ToString()=="4" ||Eval("HUONGXULY_ID").ToString()=="12")?"<br /><small class='badge badge-primary mr-t10'><i class='icofont-file-word'></i> Xuất phiếu </small>":"":""%>                                                      
                                                </a>
                                                <%--<asp:LinkButton Visible="false" ID="btn_DonThu_XuatPhieu" runat="server" OnClick="btn_SoDonThu_Click" CssClass="btn btn-default btn-flat tool-left text-primary"><i class="icofont-file-word"></i> XUẤT PHIẾU </asp:LinkButton>--%>

                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="Ngày đề đơn" HeaderStyle-HorizontalAlign="Center" SortExpression="NGUONDON_NGAYDEDON" HeaderStyle-CssClass="sticky" HeaderStyle-Width="10%">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <%# String.Format("{0:dd/MM/yyyy}", DataBinder.Eval(Container, "DataItem.NGUONDON_NGAYDEDON")) %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="Ngày tiếp nhận" HeaderStyle-HorizontalAlign="Center" SortExpression="NGAYTAO" HeaderStyle-CssClass="sticky" HeaderStyle-Width="10%">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <%# String.Format("{0:dd/MM/yyyy}", DataBinder.Eval(Container, "DataItem.NGAYTAO")) %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>    
                                       <asp:TemplateColumn HeaderText="Văn bản giải quyết" HeaderStyle-HorizontalAlign="Left" HeaderStyle-CssClass="sticky">
                                        <ItemStyle HorizontalAlign="Left" />
                                        <ItemTemplate>
                                              <%#  GetFileVanBanGiaiQuyet(Eval("DONTHU_ID").ToString()) %>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                       <asp:TemplateColumn HeaderText="Ngày giải quyết" HeaderStyle-HorizontalAlign="Left" HeaderStyle-CssClass="sticky">
                                        <ItemStyle HorizontalAlign="Left" />
                                        <ItemTemplate>
                                            <%#  KiemTraNgayGiaiQuyet(Eval("DONTHU_ID").ToString()) %>
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
    <Triggers>
        <asp:PostBackTrigger ControlID="dgDanhSach" />
    </Triggers>
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
