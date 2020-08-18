class DocsController < ApplicationController
  before_action :find_doc, only:[:show,:edit,:update,:destroy]

   #its own view - for loading all docs available
   def index
       #select * from docs order by created_at DESC
       @docs=Doc.all.order('created_at DESC')
   end
   
   #Only to display all docs list , on request as localhost:3000/docs/3
   def show
       @doc = Doc.find(params[:id]) 
   end

   #custom view ==>new.html.haml 
   #new was to just render a view for creating a new document(just display form)
   def new
       @doc=Doc.new
   end
#create method is doing 
   #fetching the data title,contents from form 
   #updating local instance of @doc with doc_params
   def create
       @doc=Doc.new(doc_params)
       
       if @doc.save
           redirect_to @doc
       else
           render 'new'
       end    	
   end

   def edit
       
   end

   def update
       if @doc.update(doc_params)
           redirect_to @doc
       else
           redirect_to 'edit'
       end		
   end

   def destroy
   
       @doc = Doc.find(params[:id])
       @doc.destroy
   
   redirect_to docs_path
   end

   private 

   def find_doc
       @doc = Doc.find(params[:id])
   end

   def doc_params
       params.require(:doc).permit(:title,:contents)
   end

end