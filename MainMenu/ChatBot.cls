 
 /*------------------------------------------------------------------------
    File        : ChatBot
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Akash Acharya
    Created     : Thu Feb 06 16:22:43 IST 2025
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.
using Progress.Windows.Form.
using System.Windows.Forms.*.

block-level on error undo, throw.

class MainMenu.ChatBot inherits Form: 
    
    define private variable ChatBotImageList as System.Windows.Forms.ImageList no-undo.
    define private variable ChatSection as System.Windows.Forms.FlowLayoutPanel no-undo.
    define private variable components as System.ComponentModel.IContainer no-undo.
    define private variable MessageSendPictureBox as System.Windows.Forms.PictureBox no-undo.
    define private variable TextChatBox as System.Windows.Forms.TextBox no-undo.
    
    //ChatBot 
    define private variable ProcedureHandle as handle no-undo.
    define private variable InputProcesswareChatText as character no-undo.
    define private variable OutputProcesswareChatText as character no-undo.
    define private variable OutputtestingChatText as character no-undo.
    define private variable UserTextBox as System.Windows.Forms.Label no-undo.
    define private variable ProcessWareTextBox as System.Windows.Forms.Label no-undo.
    define private variable ChatRowCount as integer initial 0 no-undo.
    //define private variable LocalTextBoxSize as size no-undo.
        
    constructor public ChatBot (  ):
        
        super().
        InitializeComponent().
        this-object:ComponentsCollection:ADD(this-object:components).
        catch e as Progress.Lang.Error:
            undo, throw e.
        end catch.

    end constructor.

	

    /*------------------------------------------------------------------------------
     Purpose:Process ChatBot
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    method private void MessageSendPictureBox_Click( input sender as System.Object, input e as System.EventArgs ):
        
        assign InputProcesswareChatText = "".
        
        if this-object:TextChatBox:Text <> "" then
        do:
            assign InputProcesswareChatText = this-object:TextChatBox:Text.
            this-object:TextChatBox:Text = InputProcesswareChatText.
            
            ProcessUserTextBox(InputProcesswareChatText).
            
            run MainMenu/MainMenuChatBot.p persistent set ProcedureHandle.
            run ChatBotProcessProc in ProcedureHandle(input InputProcesswareChatText , output OutputtestingChatText, output OutputProcesswareChatText).
            
            ProcessProcesswareTextBox(OutputProcesswareChatText).
            
            assign this-object:TextChatBox:Text = "".
        end.
        else
        do:
            
        end.
        
        return.

    end method.
    

    /*------------------------------------------ Create Multi line Text Box For Processware ---------------------*/
    method private void ProcessProcesswareTextBox(input ProcesswareChat as character):
        define variable ProcesswareLableWidth as integer no-undo.
        define variable ProcesswareLablePadding as integer no-undo.
        assign ProcesswareLableWidth = (ChatSection:width - 25)
               ProcesswareLablePadding = ((ProcesswareLableWidth / 2) - 10).
        
        ProcessWareTextBox = new System.Windows.Forms.Label().
        this-object:ProcessWareTextBox:Location = new System.Drawing.Point(3, 0).
        this-object:ProcessWareTextBox:Name = "ProcesswareChat".
        this-object:ProcessWareTextBox:Size = new System.Drawing.Size(ProcesswareLableWidth, 25).
        this-object:ProcessWareTextBox:MinimumSize = new System.Drawing.Size(ProcesswareLableWidth, 25).
        this-object:ProcessWareTextBox:MaximumSize = new System.Drawing.Size(ProcesswareLableWidth, 0).
        this-object:ProcessWareTextBox:Padding = new System.Windows.Forms.Padding(10, 0, ProcesswareLablePadding, 0).
        this-object:ProcessWareTextBox:AutoSize = true.
        this-object:ProcessWareTextBox:TabIndex = 13.
        this-object:ProcessWareTextBox:Text = ProcesswareChat.
        this-object:ProcessWareTextBox:UseCompatibleTextRendering = true.
        this-object:ProcessWareTextBox:ForeColor = System.Drawing.Color:ForestGreen.
        this-object:ProcessWareTextBox:Font = new System.Drawing.Font("Lucida Console", Progress.Util.CastUtil:ToSingle(9.75), System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, System.Convert:ToByte(0)).
        
        this-object:ChatSection:Controls:Add(this-object:ProcessWareTextBox).
    end method.
    /*--------------------------------------------------- END ---------------------------------------------------*/
    
    /*---------------------------------------------- Create Multi line Text Box For User ------------------------ */
    method private void ProcessUserTextBox(input UserChat as character):
        define variable UserLableWidth as integer no-undo.
        define variable UserLableLeftPadding as integer no-undo.
        assign UserLableWidth = (ChatSection:width - 25)
               UserLableLeftPadding = UserLableWidth / 2.
        
        UserTextBox = new System.Windows.Forms.Label().
        this-object:UserTextBox:Location = new System.Drawing.Point(3, 0).
        this-object:UserTextBox:Name = "UserChats".
        this-object:UserTextBox:Size = new System.Drawing.Size(UserLableWidth, 25).
        this-object:UserTextBox:MinimumSize = new System.Drawing.Size(UserLableWidth, 25).
        this-object:UserTextBox:MaximumSize = new System.Drawing.Size(UserLableWidth, 0).
        this-object:UserTextBox:Padding = new System.Windows.Forms.Padding(UserLableLeftPadding, 0, 0, 0).
        this-object:UserTextBox:AutoSize = true.
        this-object:UserTextBox:TabIndex = 13.
        this-object:UserTextBox:Text = UserChat.
        this-object:UserTextBox:UseCompatibleTextRendering = true.
        this-object:UserTextBox:ForeColor = System.Drawing.Color:DodgerBlue.
        this-object:UserTextBox:Font = new System.Drawing.Font("Segoe UI", Progress.Util.CastUtil:ToSingle(9.75), System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, System.Convert:ToByte(0)).
        this-object:UserTextBox:RightToLeft = System.Windows.Forms.RightToLeft:yes.
        if this-object:UserTextBox:PreferredHeight > this-object:UserTextBox:Size:Height then
           this-object:UserTextBox:RightToLeft = System.Windows.Forms.RightToLeft:No.
        
        this-object:ChatSection:Controls:Add(this-object:UserTextBox).
    end method.
    /*---------------------------------------------------------- END -----------------------------------------------*/
    
    /*------------------------------------------------------------------------------
     Purpose:ChatBot Chat Enter Key Hit Function
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    method private void HitEnter( input sender as System.Object, input e as System.Windows.Forms.KeyEventArgs ):
        define variable KeyStrock as character no-undo.
        KeyStrock = string(e:keycode).
        
        if (KeyStrock = "Return") then
          MessageSendPictureBox_Click(MessageSendPictureBox,e).
        
        return.

    end method.
    
    /*---------------------------------------------- InitializeComponent -------------------------- */
    method private void InitializeComponent(  ):
        
        /* NOTE: The following method is automatically generated.
        
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
        
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        this-object:components = new System.ComponentModel.Container().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable resources as Progress.Util.ResourceManager no-undo.
        resources = new Progress.Util.ResourceManager("MainMenu.ChatBot").
        this-object:TextChatBox = new System.Windows.Forms.TextBox().
        this-object:MessageSendPictureBox = new System.Windows.Forms.PictureBox().
        this-object:ChatBotImageList = new System.Windows.Forms.ImageList(this-object:components).
        this-object:ChatSection = new System.Windows.Forms.FlowLayoutPanel().
        cast(this-object:MessageSendPictureBox, System.ComponentModel.ISupportInitialize):BeginInit().
        this-object:SuspendLayout().
        /*  */
        /* TextChatBox */
        /*  */
        define variable nestedvar0 as System.Windows.Forms.AnchorStyles no-undo.
        nestedvar0 = cast(Progress.Util.EnumHelper:Or(System.Windows.Forms.AnchorStyles:Bottom, System.Windows.Forms.AnchorStyles:Left), System.Windows.Forms.AnchorStyles).
        this-object:TextChatBox:Anchor = cast(Progress.Util.EnumHelper:Or(nestedvar0, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        this-object:TextChatBox:Location = new System.Drawing.Point(117, 350).
        this-object:TextChatBox:Multiline = true.
        this-object:TextChatBox:Name = "TextChatBox".
        this-object:TextChatBox:Size = new System.Drawing.Size(590, 35).
        this-object:TextChatBox:TabIndex = 0.
        this-object:TextChatBox:KeyDown:Subscribe(this-object:HitEnter).
        /*  */
        /* MessageSendPictureBox */
        /*  */
        define variable nestedvar1 as System.Windows.Forms.AnchorStyles no-undo.
        nestedvar1 = System.Windows.Forms.AnchorStyles:Bottom.
        this-object:MessageSendPictureBox:Anchor = cast(Progress.Util.EnumHelper:Or(nestedvar1, System.Windows.Forms.AnchorStyles:Right), System.Windows.Forms.AnchorStyles).
        this-object:MessageSendPictureBox:Image = cast(resources:GetObject("MessageSendPictureBox.Image"), System.Drawing.Image).
        this-object:MessageSendPictureBox:Location = new System.Drawing.Point(714, 351).
        this-object:MessageSendPictureBox:Name = "MessageSendPictureBox".
        this-object:MessageSendPictureBox:Size = new System.Drawing.Size(33, 34).
        this-object:MessageSendPictureBox:SizeMode = System.Windows.Forms.PictureBoxSizeMode:StretchImage.
        this-object:MessageSendPictureBox:TabIndex = 4.
        this-object:MessageSendPictureBox:TabStop = false.
        this-object:MessageSendPictureBox:Click:Subscribe(this-object:MessageSendPictureBox_Click).
        /*  */
        /* ChatBotImageList */
        /*  */
        this-object:ChatBotImageList:ImageStream = cast(resources:GetObject("ChatBotImageList.ImageStream"), System.Windows.Forms.ImageListStreamer).
        this-object:ChatBotImageList:TransparentColor = System.Drawing.Color:Transparent.
        this-object:ChatBotImageList:Images:SetKeyName(0, "paper-plane.gif").
        /*  */
        /* ChatSection */
        /*  */
        define variable nestedvar2 as System.Windows.Forms.AnchorStyles no-undo.
        nestedvar2 = System.Windows.Forms.AnchorStyles:Top.
        this-object:ChatSection:Anchor = cast(Progress.Util.EnumHelper:Or(nestedvar2, System.Windows.Forms.AnchorStyles:Bottom), System.Windows.Forms.AnchorStyles).
        this-object:ChatSection:AutoScroll = true.
        this-object:ChatSection:BackColor = System.Drawing.Color:White.
        this-object:ChatSection:FlowDirection = System.Windows.Forms.FlowDirection:TopDown.
        this-object:ChatSection:Location = new System.Drawing.Point(71, 12).
        this-object:ChatSection:Name = "ChatSection".
        this-object:ChatSection:Size = new System.Drawing.Size(700, 332).
        this-object:ChatSection:TabIndex = 7.
        this-object:ChatSection:WrapContents = false.
        /*  */
        /* ChatBot */
        /*  */
        this-object:BackColor = System.Drawing.SystemColors:Control.
        this-object:ClientSize = new System.Drawing.Size(836, 396).
        this-object:Controls:Add(this-object:ChatSection).
        this-object:Controls:Add(this-object:MessageSendPictureBox).
        this-object:Controls:Add(this-object:TextChatBox).
        this-object:FormBorderStyle = System.Windows.Forms.FormBorderStyle:None.
        this-object:Name = "ChatBot".
        this-object:Text = "ChatBot".
        cast(this-object:MessageSendPictureBox, System.ComponentModel.ISupportInitialize):EndInit().
        this-object:ResumeLayout(false).
        this-object:PerformLayout().
        catch e as Progress.Lang.Error:
            undo, throw e.
        end catch.
    end method.


    destructor public ChatBot ( ):

    end destructor.

end class.