﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DsThietBi.ascx.cs" Inherits="HOPKHONGGIAY.DsThietBi" %>
<%@ Register TagPrefix="dnnsc" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.UI.WebControls" Assembly="DotNetNuke.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<script type="text/javascript" src="<%=vPathCommonJS %>"></script>
<script type="text/javascript">          
    //window.onload = function () {

    //    var favicon = document.getElementById('favicon');
    //    var faviconSize = 16;

    //    var canvas = document.createElement('canvas');
    //    canvas.width = faviconSize;
    //    canvas.height = faviconSize;

    //    var context = canvas.getContext('2d');
    //    var img = document.createElement('img');
    //    img.src = "../../Portals/0/favicon.ico";      
    //    img.onload = () => {
    //        // Draw Original Favicon as Background
    //        context.drawImage(img, 0, 0, faviconSize, faviconSize);

    //        // Draw Notification Circle
    //        context.beginPath();
    //        context.arc(canvas.width - faviconSize / 3, faviconSize / 3, faviconSize / 3, 0, 2 * Math.PI);
    //        context.fillStyle = '#FF0000';
    //        context.fill();

    //        // Draw Notification Number
    //        context.font = '10px "helvetica", sans-serif';
    //        context.textAlign = "center";
    //        context.textBaseline = "middle";
    //        context.fillStyle = '#FFFFFF';
    //        context.fillText(3, canvas.width - faviconSize / 3, faviconSize / 3);
    //        // Replace favicon
    //        favicon.href = canvas.toDataURL('image/x-icon');
    //        //this.document.getElementById("fafa").src = canvas.toDataURL('image/png');
    //    };
    //};

    function Remove_tab() {
        $(".paping").each(function () {
            var $this = $(this);
            $this.html($this.html().replace(/&nbsp;/g, ''));
        });
    }
</script>
<asp:UpdateProgress ID="prgLoadingStatus" runat="server" DynamicLayout="true">
    <ProgressTemplate>
        <div id="overlay">
            <div id="modalprogress">
                <asp:Image ID="imgWaitIcon" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/DesktopModules/HOPKHONGGIAY/Images/ajax-loader.gif" />
            </div>
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel runat="server" ID="upn">
    <ContentTemplate>    
         <script type="text/javascript" language="javascript">
             Sys.Application.add_load(Remove_tab);
        </script>        
        <div>
            <div id="modalPopUp" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">
                                <span id="spnTitle"></span>
                            </h4>
                        </div>
                        <div class="modal-body">
                            <p>
                                <span id="spnMsg"></span>.
                            </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Không</button>
                            <button type="button" id="btnConfirm" class="btn btn-danger">
                                Có</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:Panel ID="pnlFormDanhSach" runat="server" CssClass="form mr-b10" DefaultButton="buttonSearch" >
            <div class="form-inline">
                <div class="col-right mr-b6">
                    <asp:TextBox CssClass="form-control btn-sm" OnTextChanged="btnSearch_Click" Width="400" AutoPostBack="true" ID="textSearchContent" placeholder="Nhập từ khóa..." runat="server"></asp:TextBox>
                    
                    
                    <asp:DropDownList Visible="true" ID="ddlistTrangThai" runat="server" OnSelectedIndexChanged="btnSearch_Click" AutoPostBack="true" CssClass="form-control slPhongBan" AppendDataBoundItems="true">
                        <asp:ListItem Text="Tất cả trạng thái" Value="-1" Selected="True"/>
                          <asp:ListItem Text="Sử dụng" Value="1" />
                        <asp:ListItem Text="Không sử dụng" Value="0" />
                        
                    </asp:DropDownList>
                    <asp:LinkButton ID="buttonSearch" runat="server" Visible="false" CssClass="btn btn-primary btn-sm btn-search" OnClick="btnSearch_Click">
                <i class="glyphicon glyphicon-search"></i>&nbsp;Tìm
                    </asp:LinkButton>
                </div>
                <div class="col-left" runat="server">
                    <asp:LinkButton ID="btn_ThemMoi" runat="server" OnClick="btnThemMoi_Click" CssClass="btn btn-primary waves-effect none-radius none-shadow btn-sm mr-r3 min-width-100 mr-t3 mr-b6 fleft"><i class="icofont-plus"></i> Thêm mới</asp:LinkButton>
                    <div id="divShowBtnXoa" style="display: none;" class="fleft">
                        <button type="button" class="btn-default btn-warning-delete btn-sm none-radius  btn min-width-100 mr-t3 mr-b3" onclick="confirm_delete_rows_update('<%=btn_Xoa.ClientID%>')"><i class="icofont-ui-delete"></i>Xóa</button>
                    </div>
                    <div style="display: none;" >
                        <asp:LinkButton ID="btn_Xoa" OnClientClick="return getConfirmation(this, 'THÔNG BÁO','Bạn chắc chắn muốn xóa những thiết bị đã chọn?');" CausesValidation="false" Visible="true" runat="server" CssClass="btn-default btn-sm none-radius  btn min-width-100 mr-t3 mr-b3" OnClick="btn_Xoa_Click"><i class=""></i> Xóa</asp:LinkButton>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlDanhSach" runat="server" CssClass="danhsach" >
            <asp:Panel CssClass="baoloi" runat="server" ID="pnlThongBao" Visible="false">
                <asp:Label ID="lblThongBao" runat="server" Text=""></asp:Label>
            </asp:Panel>

            <asp:DataGrid DataKeyField="THIETBI_ID" runat="server" ID="dgDanhSach" OnInit="dgDanhSach_Init" AutoGenerateColumns="False" OnItemDataBound="dgDanhSach_ItemDataBound" OnPageIndexChanged="dgDanhSach_PageIndexChanged" AllowPaging="True" AllowCustomPaging="False" OnItemCreated="dgDanhSach_ItemCreated">
                <HeaderStyle CssClass="tieude" />
                <Columns>
                    <asp:TemplateColumn HeaderText="STT" Visible="true">
                        <HeaderTemplate>
                            <asp:CheckBox ID="chkAll" runat="server" onclick="handle_checked_delete_all_rows(this,'divShowBtnXoa');" />
                        </HeaderTemplate>
                        <HeaderStyle Width="3%" />
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                            Font-Underline="False" HorizontalAlign="Center" Width="3%" />
                        <ItemTemplate>
                            <asp:CheckBox ID="chkRow" runat="server" onclick="handle_checked_delete_row(this,'divShowBtnXoa');" />
                        </ItemTemplate>
                    </asp:TemplateColumn>
                    <asp:BoundColumn HeaderText="THIETBI_ID" DataField="THIETBI_ID" Visible="false">
                        <ItemStyle HorizontalAlign="Left" />
                        <HeaderStyle />
                    </asp:BoundColumn>
                   <%-- <asp:TemplateColumn HeaderText="TT">
                        <HeaderStyle Width="5%" />
                        <ItemStyle Width="5%" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# STT() %>
                        </ItemTemplate>
                    </asp:TemplateColumn>--%>

                      <asp:TemplateColumn HeaderText="Tên thiết bị" HeaderStyle-HorizontalAlign="Left">
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <a id="dgChiTiet" onserverclick="dgDanhSach_Sua" title="Cập nhật thông tin thiết bị"  href='<%# Eval("THIETBI_ID").ToString() %>' oncontextmenu="return false" runat="server"> <%# DataBinder.Eval(Container, "DataItem.TENTHIETBI") %></a> 
                        </ItemTemplate>
                    </asp:TemplateColumn>

                    <asp:TemplateColumn HeaderText="Mô tả" HeaderStyle-HorizontalAlign="Left">
                        <ItemStyle HorizontalAlign="Left" />
                        <ItemTemplate>
                            <%# DataBinder.Eval(Container, "DataItem.MOTA") %>
                        </ItemTemplate>
                    </asp:TemplateColumn>               

                 <asp:TemplateColumn HeaderText="Trạng thái">
                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                        <ItemTemplate>
                            <a id="lnkKichHoat" href='<%# DataBinder.Eval(Container,"DataItem.THIETBI_ID") %>'  onserverclick="ThayDoiTrangThai" runat="server">
                                <%#(DataBinder.Eval(Container,"DataItem.TRANGTHAI").ToString().Equals("1"))?"<span class='glyphicon glyphicon-ok' style='color:#008000;'></span>":"<span style='color:red;' class='glyphicon glyphicon-minus-sign'></span>" %>                                                         
                            </a>
                        </ItemTemplate>
                    </asp:TemplateColumn>         

                <%--    <asp:TemplateColumn HeaderText="Sửa" Visible="true">
                        <HeaderStyle Width="5%" />
                        <ItemStyle Width="5%" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <a onserverclick="dgDanhSach_Sua" title="Cập nhật thông tin thiết bị" class="icon-sua" href='<%# Eval("THIETBI_ID").ToString() %>' oncontextmenu="return false" runat="server"></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>--%>

                    <asp:TemplateColumn HeaderText="Xóa" Visible="false">
                        <HeaderStyle Width="5%" />
                        <ItemStyle Width="5%" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <a onserverclick="dgDanhSach_Xoa" title="Xóa thiết bị" class="icon-xoa" onclick="return getConfirmation(this, 'XÓA THIẾT BỊ','Bạn chắc chắn muốn xóa thiết bị này?');" href='<%# Eval("THIETBI_ID").ToString()%>' oncontextmenu="return false" runat="server"></a>
                        </ItemTemplate>
                    </asp:TemplateColumn>
                </Columns>
                <PagerStyle Mode="NumericPages" CssClass="paping" PageButtonCount="9999"></PagerStyle>
            </asp:DataGrid>
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
