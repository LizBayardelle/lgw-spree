class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :destroy]



  def index
    @contacts = Contact.all
  end


  def show
  end



  def new
    @contact = Contact.new
  end



  def edit
  end



  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to root_path, notice: "Your message has been sent.  We'll get back to you shortly." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end



  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def mark_responded
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(responded: true)
      redirect_to contacts_path, notice: "That message has been marked responded."
    end
  end

  def mark_unresponded
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(responded: false)
      redirect_to contacts_path, notice: "That message has been marked unresponded."
    end
  end

  def mark_archived
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(archived: true)
      redirect_to contacts_path, notice: "That message has been marked archived."
    end
  end

  def mark_unarchived
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(archived: false)
      redirect_to contacts_path, notice: "That message has been marked unarchived."
    end
  end

  private

    def set_contact
      @contact = Contact.find(params[:id])
    end


    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :phone, :preferred_contact, :subject, :message, :responded, :archived)
    end
end
