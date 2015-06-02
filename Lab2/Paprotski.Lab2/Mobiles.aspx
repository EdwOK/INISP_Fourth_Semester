<%@ Page Title="Мобильные телефоны" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mobiles.aspx.cs" Inherits="Paprotski.Lab2.Mobiles" %>
<asp:Content ID="MobilesContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="MobilesGridView" runat="server" AllowSorting="True"
        AutoGenerateColumns="False" CssClass="table table-bordered table-condensed table-hover" 
        DataKeyNames="Id" DataSourceID="SqlMobilesSource">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
            <asp:BoundField DataField="Money" HeaderText="Money" SortExpression="Money" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Выбор"/>
                </ItemTemplate>
                <ControlStyle CssClass="btn btn-info" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle CssClass="active"/>
    </asp:GridView>
    
    <asp:DetailsView ID="MobilesDetailsView" runat="server" ValidateRequestMode="Enabled"  
        OnItemCreated="MobilesDetailsView_OnItemCreated" OnItemDeleted="MobilesDetailsView_OnItemDeleted" OnItemUpdated="MobilesDetailsView_OnItemUpdated"
        Width="350px" Height="200px" AutoGenerateRows="False" CssClass="table table-bordered table-responsive" 
        DataKeyNames="Id" DataSourceID="SqlSelectMobileSource">
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:TemplateField HeaderText="Model" SortExpression="Model">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Model") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox9" ErrorMessage="Model can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Model") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox9" ErrorMessage="Model can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Model") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Brand" SortExpression="Brand">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox8" ErrorMessage="Brand can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Brand") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox8" ErrorMessage="Brand can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Brand") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type" SortExpression="Type">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Type") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox7" ErrorMessage="Type can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Type") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox7" ErrorMessage="Type can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="OperatingSystem" SortExpression="OperatingSystem">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("OperatingSystem") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox6" ErrorMessage="OS can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("OperatingSystem") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox6" ErrorMessage="OS can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("OperatingSystem") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CPU" SortExpression="CPU">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("CPU") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox5" ErrorMessage="CPU can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("CPU") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox5" ErrorMessage="CPU can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("CPU") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="GPU" SortExpression="GPU">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("GPU") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox4" ErrorMessage="GPU can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("GPU") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox4" ErrorMessage="GPU can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("GPU") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Memory" SortExpression="Memory">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Memory") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox3" ErrorMessage="Memory can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Memory") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox3" ErrorMessage="Memory can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Memory") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Storage" SortExpression="Storage">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Storage") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox2" ErrorMessage="Storage can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Storage") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox2" ErrorMessage="Storage can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Storage") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Money" SortExpression="Money">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Money") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox1" ErrorMessage="Money can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Money") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox1" ErrorMessage="Money can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Money") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-default">
                        <asp:Label runat="server" CssClass="glyphicon glyphicon-ok"/>
                        <asp:Label runat="server" Text="&nbsp;Обновить"/>
                    </asp:LinkButton>&nbsp; <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-default">
                        <asp:Label runat="server" CssClass="glyphicon glyphicon-remove"/>
                        <asp:Label runat="server" Text="&nbsp;Отмена"/>
                    </asp:LinkButton></EditItemTemplate><InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-default">
                        <asp:Label runat="server" CssClass="glyphicon glyphicon-ok"/>
                        <asp:Label runat="server" Text="&nbsp;Добавить"/>
                    </asp:LinkButton>&nbsp; <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-default">
                        <asp:Label runat="server" CssClass="glyphicon glyphicon-remove"/>
                        <asp:Label runat="server" Text="&nbsp;Отмена"/>
                    </asp:LinkButton></InsertItemTemplate><ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-default">
                        <asp:Label runat="server" CssClass="glyphicon glyphicon-pencil"/>
                        <asp:Label runat="server" Text="&nbsp;Изменить"/>
                    </asp:LinkButton>&nbsp; <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="New" CssClass="btn btn-default">
                        <asp:Label runat="server" CssClass="glyphicon glyphicon-file"/>
                        <asp:Label runat="server" Text="&nbsp;Создать"/>
                    </asp:LinkButton>&nbsp; <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-default">
                        <asp:Label runat="server" CssClass="glyphicon glyphicon-trash"/>
                        <asp:Label runat="server" Text="&nbsp;Удалить"/>
                    </asp:LinkButton></ItemTemplate></asp:TemplateField></Fields></asp:DetailsView><asp:SqlDataSource ID="SqlSelectMobileSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBCatalog %>" 
        DeleteCommand="DELETE FROM [Mobiles] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Mobiles] ([Id], [Model], [Brand], [Type], [OperatingSystem], [CPU], [GPU], [Memory], [Storage], [Money]) VALUES (@Id, @Model, @Brand, @Type, @OperatingSystem, @CPU, @GPU, @Memory, @Storage, @Money)" 
        SelectCommand="SELECT * FROM [Mobiles] WHERE ([Id] = @Id)" 
        UpdateCommand="UPDATE [Mobiles] SET [Model] = @Model, [Brand] = @Brand, [Type] = @Type, [OperatingSystem] = @OperatingSystem, [CPU] = @CPU, [GPU] = @GPU, [Memory] = @Memory, [Storage] = @Storage, [Money] = @Money WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Brand" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="OperatingSystem" Type="String" />
            <asp:Parameter Name="CPU" Type="String" />
            <asp:Parameter Name="GPU" Type="String" />
            <asp:Parameter Name="Memory" Type="String" />
            <asp:Parameter Name="Storage" Type="String" />
            <asp:Parameter Name="Money" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="MobilesGridView" Name="Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Brand" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="OperatingSystem" Type="String" />
            <asp:Parameter Name="CPU" Type="String" />
            <asp:Parameter Name="GPU" Type="String" />
            <asp:Parameter Name="Memory" Type="String" />
            <asp:Parameter Name="Storage" Type="String" />
            <asp:Parameter Name="Money" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlMobilesSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBCatalog %>" SelectCommand="SELECT [Id], [Brand], [Money], [Model] FROM [Mobiles]"></asp:SqlDataSource>
</asp:Content>
