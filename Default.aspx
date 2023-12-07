<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-bottom: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:MultiView ID="CBF110020_MV1" ActiveViewIndex="0" runat="server">
            <asp:View ID="CBF110020_View1" runat="server">
            <asp:GridView ID="CBF110020_GV1" DataKeyNames="id" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSource1" EmptyDataText="沒有資料錄可顯示。" ForeColor="Black" GridLines="None" OnRowDeleted="CBF110020_GV1_RowDeleted">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Wrap="false"><EditItemTemplate><asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>&nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton></EditItemTemplate><ItemTemplate><asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>&nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('你確認要刪除嗎?')" CausesValidation="False" CommandName="Delete" Text="刪除"></asp:LinkButton></ItemTemplate><ItemStyle Wrap="False"></ItemStyle></asp:TemplateField>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                    <asp:BoundField DataField="word" HeaderText="word" SortExpression="word" />
                    <asp:BoundField DataField="ch_explanation" HeaderText="ch_explanation" SortExpression="ch_explanation" />
                    <asp:TemplateField HeaderText="sentence" SortExpression="sentence"><EditItemTemplate><asp:TextBox ID="TextBox1" TextMode="MultiLine" Width="98%" runat="server" Text='<%# Bind("sentence") %>'></asp:TextBox></EditItemTemplate><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("sentence") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="sno" HeaderText="sno" SortExpression="sno" />
                    <asp:BoundField DataField="level" HeaderText="level" SortExpression="level" />
                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM gept_words WHERE (Id = @id)" SelectCommand="SELECT [Id], [word], [ch_explanation], [sentence], [sno], [level], [frequency], [weight] FROM [gept_words] ORDER BY [Id]" InsertCommand="INSERT INTO [gept_words] ([Id], [word], [ch_explanation], [sentence], [sno], [level], [frequency], [weight]) VALUES (@Id, @word, @ch_explanation, @sentence, @sno, @level, @frequency, @weight)" UpdateCommand="UPDATE gept_words SET word = @word, ch_explanation = @ch_explanation, sentence = @sentence, sno = @sno, level = @level WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id" Type="Double" />
                    <asp:Parameter Name="word" Type="String" />
                    <asp:Parameter Name="ch_explanation" Type="String" />
                    <asp:Parameter Name="sentence" Type="String" />
                    <asp:Parameter Name="sno" Type="String" />
                    <asp:Parameter Name="level" Type="Double" />
                    <asp:Parameter Name="frequency" Type="Double" />
                    <asp:Parameter Name="weight" Type="Double" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="word" />
                    <asp:Parameter Name="ch_explanation" />
                    <asp:Parameter Name="sentence" />
                    <asp:Parameter Name="sno" />
                    <asp:Parameter Name="level" />
                    <asp:Parameter Name="id" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            請點選單字來查閱中文解釋<br />
            <asp:DropDownList ID="CBF110020_DDL1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="word" DataValueField="ch_explanation" OnSelectedIndexChanged="CBF110020_DDL1_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:Button ID="CBF110020_PreviousButton" runat="server" CssClass="auto-style1" Text="PreviousButton" OnClick="CBF110020_PreviousButton_Click" />
            <asp:Button ID="CBF110020_NextButton" runat="server" Text="NextButton" OnClick="CBF110020_NextButton_Click" />
            <asp:Button ID="CBF110020_testBtn" runat="server" Text="測驗去" OnClick="CBF110020_testBtn_Click" />    
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT *FROM [gept_words]ORDER BY id OFFSET @StartIndex ROWS FETCH NEXT 10 ROWS ONLY;">
                <SelectParameters>
                    <asp:SessionParameter DbType="Int32" DefaultValue="0" Name="StartIndex" SessionField="StartIndex" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Literal ID="CBF110020_cambridge" runat="server"></asp:Literal>
            <br />
            <br />
            <a href="https://github.com/Bo-Yen-Chou/Quiz5/blob/main/gept_words_reflections.html">GitHub心得</a>&nbsp; <a href="gept_words_reflections.html">本地端心得網頁</a>
            </asp:View>
            <asp:View ID="CBF110020_View2" runat="server">        
            <asp:Literal ID="CBF110020_ch_hint" runat="server"></asp:Literal>
            <asp:TextBox ID="CBF110020_input" runat="server" onclick="this.setSelectionRange(0,999)" onfocus="this.setSelectionRange(0,999)" AutoComplete="off"></asp:TextBox>
            <asp:Button ID="CBF110020_nextQBtn" runat="server" Text="下一題" OnClick="CBF110020_nextQBtn_Click" />
            <br />
            請輸入完整單字(底線是用來提示有幾個字元, 如果消失了可以移動滑鼠至方格上來查看.)
        </asp:View>        
            </asp:MultiView>
        </div>
    </form>
</body>
</html>
