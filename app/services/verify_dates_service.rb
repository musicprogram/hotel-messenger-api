class VerifyDatesService
  attr_reader :fecha_x_str, :start_day, :end_day

  def initialize(fecha_x_str,start_day,end_day)
    @fecha_x_str = fecha_x_str
    @start_day = start_day
    @end_day = end_day
  end

  def time_diference
    # Elimina la parte del string que no es necesaria (la parte de GMT y la zona horaria)
    fecha_x_str_sin_gmt = fecha_x_str.gsub(/ GMT.*$/, '')

    # Parsea el string a un objeto de tiempo

    fecha_x = Time.parse(fecha_x_str_sin_gmt)

    if fecha_x > Time.now
      # Calcula la diferencia de tiempo entre ahora y fecha_x
      diferencia_tiempo = fecha_x - Time.now
      # Convierte la diferencia de tiempo a días y horas
      dias = (diferencia_tiempo / (60 * 60 * 24)).to_i
      horas = ((diferencia_tiempo % (60 * 60 * 24)) / (60 * 60)).to_i
      diference_time = dias <= 0 && horas <= 0
      {
        dias: dias,
        horas: horas,
        diference_time: false
      }
    else
      {
        dias: 0,
        horas: 0,
        diference_time: true
      }
    end
  end

  def is_working_chat
    if !start_day && !end_day
        "!! Has not started ¡¡"
      elsif start_day && !end_day
        "!! is working ¡¡"
      elsif start_day && end_day
        "!! Finish ¡¡"
    end
  end
end
