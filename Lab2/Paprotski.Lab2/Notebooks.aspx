<%@ Page Title="Ноутбуки" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Notebooks.aspx.cs" Inherits="Paprotski.Lab2.Notebook" %>
<asp:Content ID="NotebooksContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="NotebooksGridView" runat="server" AutoGenerateColumns="False" AllowSorting="True"
         CssClass="table table-bordered table-condensed table-hover" DataKeyNames="Id" DataSourceID="SqlNotebooksSource">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Money" HeaderText="Money" SortExpression="Money" />
            <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="btn btn-info" />
        </Columns>
        <HeaderStyle CssClass="active" />
    </asp:GridView>
    
    <asp:DetailsView ID="NotebooksDetailsView" runat="server" Width="350px" Height="200px" 
        AutoGenerateRows="False" CssClass="table table-bordered table-responsive"
        OnItemCreated="NotebooksDetailsView_OnItemCreated" OnItemDeleted="NotebooksDetailsView_OnItemDeleted" OnItemUpdated="NotebooksDetailsView_OnItemUpdated" 
        DataKeyNames="Id" DataSourceID="SqlNotebookSelectSource" >
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
            <asp:TemplateField HeaderText="Manufacturer" SortExpression="Manufacturer">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Manufacturer") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox2" ErrorMessage="Manufacturer can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Manufacturer") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox2" ErrorMessage="Manufacturer can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Manufacturer") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type" SortExpression="Type">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Type") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox3" ErrorMessage="Type can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Type") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox3" ErrorMessage="Type can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="OperatingSystem" SortExpression="OperatingSystem">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("OperatingSystem") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox4" ErrorMessage="OS can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("OperatingSystem") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox4" ErrorMessage="OS can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("OperatingSystem") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Screen" SortExpression="Screen">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Screen") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox5" ErrorMessage="Screen can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Screen") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox5" ErrorMessage="Screnn can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Screen") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="GPU" SortExpression="GPU">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("GPU") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox6" ErrorMessage="GPU can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("GPU") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox6" ErrorMessage="GPU can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("GPU") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CPU" SortExpression="CPU">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("CPU") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox7" ErrorMessage="CPU can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("CPU") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox7" ErrorMessage="CPU can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("CPU") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Memory" SortExpression="Memory">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Memory") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox8" ErrorMessage="Memory can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Memory") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox8" ErrorMessage="Memory can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Memory") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Storage" SortExpression="Storage">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Storage") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox9" ErrorMessage="Storage can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Storage") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox9" ErrorMessage="Storage can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Storage") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Money" SortExpression="Money">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Money") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox10" ErrorMessage="Money can't be empty"/>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("Money") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="TextBox10" ErrorMessage="Money can't be empty"/>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Money") %>'></asp:Label>
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

    <asp:SqlDataSource ID="SqlNotebookSelectSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBCatalog %>" 
        DeleteCommand="DELETE FROM [Notebooks] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Notebooks] ([Id], [Model], [Manufacturer], [Type], [OperatingSystem], [Screen], [GPU], [CPU], [Memory], [Storage], [Money]) VALUES (@Id, @Model, @Manufacturer, @Type, @OperatingSystem, @Screen, @GPU, @CPU, @Memory, @Storage, @Money)" 
        SelectCommand="SELECT * FROM [Notebooks] WHERE ([Id] = @Id)" 
        UpdateCommand="UPDATE [Notebooks] SET [Model] = @Model, [Manufacturer] = @Manufacturer, [Type] = @Type, [OperatingSystem] = @OperatingSystem, [Screen] = @Screen, [GPU] = @GPU, [CPU] = @CPU, [Memory] = @Memory, [Storage] = @Storage, [Money] = @Money WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Manufacturer" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="OperatingSystem" Type="String" />
            <asp:Parameter Name="Screen" Type="String" />
            <asp:Parameter Name="GPU" Type="String" />
            <asp:Parameter Name="CPU" Type="String" />
            <asp:Parameter Name="Memory" Type="String" />
            <asp:Parameter Name="Storage" Type="String" />
            <asp:Parameter Name="Money" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="NotebooksGridView" Name="Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="Manufacturer" Type="String" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="OperatingSystem" Type="String" />
            <asp:Parameter Name="Screen" Type="String" />
            <asp:Parameter Name="GPU" Type="String" />
            <asp:Parameter Name="CPU" Type="String" />
            <asp:Parameter Name="Memory" Type="String" />
            <asp:Parameter Name="Storage" Type="String" />
            <asp:Parameter Name="Money" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlNotebooksSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBCatalog %>" SelectCommand="SELECT * FROM [Notebooks]" />
</asp:Content>
