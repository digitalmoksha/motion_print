module Kernel
  def mp(object, options = {})
    output_stream = RUBYMOTION_ENV == "test" ? $stderr : $stdout
    log = MotionPrint.logger(object, options)

    if MotionPrint.nslog_enabled? || options[:nslog]
      log.split("\n").each { |line| NSLog(line) }
    else
      output_stream.puts log
    end

    object unless MotionPrint.console?
  end

  module_function :mp
end
