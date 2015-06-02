<%@ Page Title="Телевизоры" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Televisions.aspx.cs" Inherits="Paprotski.Lab2.Televisions" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="TelevisionsGridView" runat="server" AutoGenerateColumns="False" AllowSorting="True"
        CssClass="table table-bordered table-condensed table-hover" DataKeyNames="Id" DataSourceID="SqlTelevisionsSource">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Money" HeaderText="Money" SortExpression="Money" />
            <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="btn btn-info" />
        </Columns>
        <HeaderStyle CssClass="active"/>
    </asp:GridView>
    <asp:DetailsView ID="DetailsView1" runat="server" Width="350px" Height="200px" 
        CssClass="table table-bordered table-responsive" AutoGenerateRows="False" 
        OnItemCreated="DetailsView1_OnItemCreated" OnItemDeleted="DetailsView1_OnItemDeleted" OnItemUpdated="DetailsView1_OnItemUpdated"
        DataKeyNames="Id" DataSourceID="SqlTelevisionSelectSource">
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:TemplateField HeaderText="Model" SortExpression="Model">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Model") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox1" ErrorMessage="Model can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Model") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox1" ErrorMessage="Model can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Brand" SortExpression="Brand">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox7" ErrorMessage="Brand can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox7" ErrorMessage="Brand can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Brand") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type" SortExpression="Type">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Type") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox2" ErrorMessage="Type can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Type") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox2" ErrorMessage="Type can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="AspectRatio" SortExpression="AspectRatio">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("AspectRatio") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox3" ErrorMessage="Type can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("AspectRatio") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox3" ErrorMessage="Type can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("AspectRatio") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ScreenSize" SortExpression="ScreenSize">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ScreenSize") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox4" ErrorMessage="ScreenSize can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ScreenSize") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox4" ErrorMessage="ScreenSize can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ScreenSize") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Resolution" SortExpression="Resolution">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Resolution") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox5" ErrorMessage="Resolution can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Resolution") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox5" ErrorMessage="Resolution can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Resolution") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Money" SortExpression="Money">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Money") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox6" ErrorMessage="Money can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Money") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox6" ErrorMessage="Money can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Money") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-default">
                        <asp:Label runat="server" CssClass="glyphicon glyphicon-ok"/>
                        <asp:Label runat="server" Text="&nbsp;Обновить"/>
                    </asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-default">
                        <asp:Label runat="server" CssClass="glyphicon glyphicon-remove"/>
                        <asp:Label runat="server" Text="&nbsp;Отмена"/>
                    </asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-default">
                        <asp:Label runat="server" CssClass="glyphicon glyphicon-ok"/>
                        <asp:Label runat="server" Text="&nbsp;Добавить"/>
                    </asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-default">
                        <asp:Label runat="server" CssClass="glyphicon glyphicon-remove"/>
                        <asp:Label runat="server" Text="&nbsp;Отмена"/>
                    </asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-default">
                        <asp:Label runat="server" CssClass="glyphicon glyphicon-pencil"/>
                        <asp:Label runat="server" Text="&nbsp;Изменить"/>
                    </asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="New" CssClass="btn btn-default">
                        <asp:Label runat="server" CssClass="glyphicon glyphicon-file"/>
                        <asp:Label runat="server" Text="&nbsp;Создать"/>
                    </asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-default">
                        <asp:Label runat="server" CssClass="glyphicon glyphicon-trash"/>
                        <asp:Label runat="server" Text="&nbsp;Удалить"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlTelevisionSelectSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBCatalog %>" 
        DeleteCommand="DELETE FROM [Televisions] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Televisions] ([Id], [Model], [Brand], [Type], [AspectRatio], [ScreenSize], [Resolution], [Money]) VALUES (@Id, @Model, @Brand, @Type, @AspectRatio, @ScreenSize, @Resolution, @Money)" 
        SelectCommand="SELECT * FROM [Televisions] WHERE ([Id] = @Id)" 
        UpdateCommand="UPDATE [Televisions] SET [Model] = @Model, [Brand] = @Brand, [Type] = @Type, [AspectRatio] = @AspectRatio, [ScreenSize] = @ScreenSize, [Resolution] = @Resolution, [Money] = @Money WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Brand" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="AspectRatio" Type="String" />
            <asp:Parameter Name="ScreenSize" Type="String" />
            <asp:Parameter Name="Resolution" Type="String" />
            <asp:Parameter Name="Money" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="TelevisionsGridView" Name="Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Brand" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="AspectRatio" Type="String" />
            <asp:Parameter Name="ScreenSize" Type="String" />
            <asp:Parameter Name="Resolution" Type="String" />
            <asp:Parameter Name="Money" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlTelevisionsSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBCatalog %>" SelectCommand="SELECT * FROM [Televisions]"></asp:SqlDataSource>
</asp:Content>
