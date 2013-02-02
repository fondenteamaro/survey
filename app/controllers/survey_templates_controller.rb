class SurveyTemplatesController < ApplicationController

  def export

    @survey_template = SurveyTemplate.find(params[:id])
    spreadsheet = StringIO.new ""
    book = Spreadsheet::Workbook.new
    linea=0
    @survey_template.survey_responses.each do |sr|
      i||=0
      i=i+1
      sheet = book.create_worksheet#(:name=>"#{i} #{sr.azienda}")
      bold = Spreadsheet::Format.new :weight => :bold
      sheet.update_row 0, @survey_template.nome
      sheet.update_row 1, "","Azienda",sr.azienda
      sheet.update_row 2, "","Nome e Cognome","#{sr.nome} #{sr.cognome}"
      sheet.update_row 3, "","Telefono","#{sr.telefono}"
      sheet.update_row 4, "","Email","#{sr.email}"
      sheet.update_row 5, "CODICE",	"DESCRIZIONE","UNITA' DI MISURA",	"DATI ANNUALI"
      sheet.column(1).width=100
      format = Spreadsheet::Format.new
      format.top=:medium
      format.bottom=:medium
      format.left=:medium
      format.right=:medium
      bold = format.clone
      bold.font.weight=:bold
      grigio = format.clone
      grigio.font.weight=:bold
      grigio.pattern=1
      grigio.pattern_bg_color=:gray
      grigio.pattern_fg_color=:gray
      linea =5
      sheet.row(linea).set_format(0, bold)
      sheet.row(linea).set_format(1, bold)
      sheet.row(linea).set_format(2, bold)
      sheet.row(linea).set_format(3, bold)
      linea =6
      gruppo =""
      sr.survey_response_lines.each do |srl|
         unless gruppo.eql?(srl.gruppo)
           gruppo= srl.gruppo
           sheet.update_row linea, "", gruppo
           sheet.row(linea).set_format(0, grigio)
           sheet.row(linea).set_format(1, grigio)
           sheet.row(linea).set_format(2, grigio)
           linea+=1
         end
         sheet.update_row linea, srl.codice,	srl.domanda,srl.um,	srl.risposta
         (0..4).each{|i| sheet.row(linea).set_format(i, format)}
         linea+=1
      end
      linea.times do |i|
        sheet.row(i).height=25
      end
    end

    book.write spreadsheet
    send_data spreadsheet.string, :type=>"application/excel", :disposition=>'attachment', :filename => 'out.xls'
  end

  def index
    @survey_templates = SurveyTemplate.all
  end

  def show
    @survey_template = SurveyTemplate.find(params[:id])
  end

  def new
    @survey_template = SurveyTemplate.new
  end

  def create
    @survey_template = SurveyTemplate.new(params[:survey_template])
    if @survey_template.save
      redirect_to @survey_template, :notice => "Successfully created survey template."
    else
      render :action => 'new'
    end
  end

  def edit
    @survey_template = SurveyTemplate.find(params[:id])
    @survey_template_lines = @survey_template.survey_template_lines
  end

  def update
    @survey_template = SurveyTemplate.find(params[:id])
    if @survey_template.update_attributes(params[:survey_template])
      redirect_to @survey_template, :notice  => "Successfully updated survey template."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @survey_template = SurveyTemplate.find(params[:id])
    @survey_template.destroy
    redirect_to survey_templates_url, :notice => "Successfully destroyed survey template."
  end
end
