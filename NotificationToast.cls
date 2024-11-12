 
/*------------------------------------------------------------------------
   File        : NotificationToast
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : Akash Acharya
   Created     : Fri Oct 18 15:49:15 IST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

using Progress.Lang.*.
using Progress.Windows.Form.
using Progress.Lang.Object.
using System.Windows.Forms.*.

block-level on error undo, throw.

class NotificationToast inherits Form: 
    
    define private variable components               as System.ComponentModel.IContainer no-undo.
    define private variable DesignPanel              as System.Windows.Forms.Panel       no-undo.
    define private variable NotCloseIcon             as System.Windows.Forms.PictureBox  no-undo.
    define private variable NotIcon                  as System.Windows.Forms.PictureBox  no-undo.
    define private variable NotDetails               as System.Windows.Forms.Label       no-undo.
    define private variable NotSubject               as System.Windows.Forms.Label       no-undo.
    
    //Toast Location
    define private variable ToastLocationX           as integer                          no-undo.
    define private variable ToastLocationY           as integer                          no-undo.
    //End Of Toast Location
    
    //Toast Local Variable
    define private variable inLocalNotification      as character                        no-undo.
    define private variable LocalNotificationCounter as integer                          initial 0 no-undo.
    
    //End Toast Local Variable
    
    constructor public NotificationToast():
        
        super().
        InitializeComponent().
        this-object:ComponentsCollection:ADD(this-object:components).
        catch e as Progress.Lang.Error:
            undo, throw e.
        end catch.

    end constructor.
        
    constructor public NotificationToast(input inNotification as character, input inLocalNotificationCounter as integer):
        
        super().
        
        assign 
            inLocalNotification = inNotification
            LocalNotificationCounter = inLocalNotificationCounter.
            
        InitializeComponent().
        this-object:ComponentsCollection:ADD(this-object:components).
        catch e as Progress.Lang.Error:
            undo, throw e.
        end catch.

    end constructor.
 
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
    @VisualDesigner.
    method private void NotificationToast_Load( input sender as System.Object, input e as System.EventArgs ):
  
        this-object:NotSubject:Text = inLocalNotification.
        NotDisplayPosition().
        return.

    end method.
    
    @VisualDesigner.
    method private void NotDisplayPosition( ):
        define variable UserScreenWidth  as integer no-undo.
        define variable UserScreenHeight as integer no-undo.
        
        assign 
            UserScreenWidth  = Screen:PrimaryScreen:WorkingArea:Width
            UserScreenHeight = screen:PrimaryScreen:WorkingArea:Height.
            
        assign 
            ToastLocationX = UserScreenWidth - this-object:width 
            ToastLocationY = UserScreenHeight - this-object:height + 50 .
            
        if LocalNotificationCounter >= 1 then
        do:
            assign 
                ToastLocationY = ToastLocationY - (LocalNotificationCounter * 60).
            this-object:Location = new System.Drawing.Point(ToastLocationX,ToastLocationY).
        end.
        else
        do:
            ToastLocationY = ToastLocationY - 60.
            this-object:Location = new System.Drawing.Point(ToastLocationX,ToastLocationY).
        end.
        
        
        return.

    end method.
    
    @VisualDesigner.
    method private void NotCloseIcon_Click( input sender as System.Object, input e as System.EventArgs ):
        this-object:Close().
        return.

    end method.
    
    /*------------------------------------------------------------------------------------------------------------------------------------
     Purpose: InitializeComponent
     Notes:
    ------------------------------------------------------------------------------------------------------------------------------------*/

    method private void InitializeComponent(  ):
        
        /* NOTE: The following method is automatically generated.
        
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
        
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        @VisualDesigner.FormMember (NeedsInitialize="true").
        define variable resources as Progress.Util.ResourceManager no-undo.
        resources = new Progress.Util.ResourceManager("NotificationToast").
        this-object:NotIcon = new System.Windows.Forms.PictureBox().
        this-object:NotSubject = new System.Windows.Forms.Label().
        this-object:NotDetails = new System.Windows.Forms.Label().
        this-object:DesignPanel = new System.Windows.Forms.Panel().
        this-object:NotCloseIcon = new System.Windows.Forms.PictureBox().
        cast(this-object:NotIcon, System.ComponentModel.ISupportInitialize):BeginInit().
        cast(this-object:NotCloseIcon, System.ComponentModel.ISupportInitialize):BeginInit().
        this-object:SuspendLayout().
        /*  */
        /* NotIcon */
        /*  */
        this-object:NotIcon:Image = cast(resources:GetObject("NotIcon.Image"), System.Drawing.Image).
        this-object:NotIcon:Location = new System.Drawing.Point(18, 15).
        this-object:NotIcon:Name = "NotIcon".
        this-object:NotIcon:Size = new System.Drawing.Size(24, 24).
        this-object:NotIcon:SizeMode = System.Windows.Forms.PictureBoxSizeMode:StretchImage.
        this-object:NotIcon:TabIndex = 0.
        this-object:NotIcon:TabStop = false.
        /*  */
        /* NotSubject */
        /*  */
        this-object:NotSubject:Location = new System.Drawing.Point(70, 9).
        this-object:NotSubject:Name = "NotSubject".
        this-object:NotSubject:Size = new System.Drawing.Size(178, 19).
        this-object:NotSubject:TabIndex = 1.
        this-object:NotSubject:Text = "label1".
        this-object:NotSubject:UseCompatibleTextRendering = true.
        this-object:NotSubject:Click:Subscribe(this-object:NotSubject_Click).
        /*  */
        /* NotDetails */
        /*  */
        this-object:NotDetails:Location = new System.Drawing.Point(70, 30).
        this-object:NotDetails:Name = "NotDetails".
        this-object:NotDetails:Size = new System.Drawing.Size(218, 23).
        this-object:NotDetails:TabIndex = 2.
        this-object:NotDetails:Text = "label2".
        this-object:NotDetails:UseCompatibleTextRendering = true.
        /*  */
        /* DesignPanel */
        /*  */
        this-object:DesignPanel:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(106)), System.Convert:ToInt32(System.Convert:ToByte(145)), System.Convert:ToInt32(System.Convert:ToByte(212))).
        this-object:DesignPanel:Dock = System.Windows.Forms.DockStyle:Left.
        this-object:DesignPanel:Location = new System.Drawing.Point(0, 0).
        this-object:DesignPanel:Name = "DesignPanel".
        this-object:DesignPanel:Size = new System.Drawing.Size(11, 60).
        this-object:DesignPanel:TabIndex = 3.
        /*  */
        /* NotCloseIcon */
        /*  */
        this-object:NotCloseIcon:Cursor = System.Windows.Forms.Cursors:Hand.
        this-object:NotCloseIcon:Image = cast(resources:GetObject("NotCloseIcon.Image"), System.Drawing.Image).
        this-object:NotCloseIcon:Location = new System.Drawing.Point(272, 0).
        this-object:NotCloseIcon:Name = "NotCloseIcon".
        this-object:NotCloseIcon:Size = new System.Drawing.Size(25, 27).
        this-object:NotCloseIcon:SizeMode = System.Windows.Forms.PictureBoxSizeMode:StretchImage.
        this-object:NotCloseIcon:TabIndex = 4.
        this-object:NotCloseIcon:TabStop = false.
        this-object:NotCloseIcon:Click:Subscribe(this-object:NotCloseIcon_Click).
        /*  */
        /* NotificationToast */
        /*  */
        this-object:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(207)), System.Convert:ToInt32(System.Convert:ToByte(237)), System.Convert:ToInt32(System.Convert:ToByte(233))).
        this-object:ClientSize = new System.Drawing.Size(300, 60).
        this-object:Controls:Add(this-object:NotCloseIcon).
        this-object:Controls:Add(this-object:DesignPanel).
        this-object:Controls:Add(this-object:NotDetails).
        this-object:Controls:Add(this-object:NotSubject).
        this-object:Controls:Add(this-object:NotIcon).
        this-object:FormBorderStyle = System.Windows.Forms.FormBorderStyle:None.
        this-object:Name = "NotificationToast".
        this-object:Text = "NotificationToast".
        this-object:Load:Subscribe(this-object:NotificationToast_Load).
        cast(this-object:NotIcon, System.ComponentModel.ISupportInitialize):EndInit().
        cast(this-object:NotCloseIcon, System.ComponentModel.ISupportInitialize):EndInit().
        this-object:ResumeLayout(false).
        catch e as Progress.Lang.Error:
            undo, throw e.
        end catch.
    end method.

	/*------------------------------------------------------------------------------
	 Purpose:
	 Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	method private void NotSubject_Click( input sender as System.Object, input e as System.EventArgs ):
		
		return.

	end method.
	

    destructor public NotificationToast ( ):

    end destructor.

end class.