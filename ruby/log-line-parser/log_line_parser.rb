# frozen_string_literal: true

class LogLineParser
  LOG_LEVELS = {
    '[ERROR]:' => 'error',
    '[INFO]:' => 'info',
    '[WARNING]:' => 'warning'
  }.freeze
  SPACE = ' '

  def initialize(line)
    @line = line
    @log_level = nil
    @message = nil
    parse_line
  end

  def message
    @message
  end

  def log_level
    @log_level
  end

  def reformat
    "#{@message} (#{@log_level})"
  end

  private

  def parse_line
    log_messages = @line.split(SPACE)
    @log_level = LOG_LEVELS[log_messages[0]]
    if log_level
      log_messages = log_messages.drop(1)
    end

    @message = log_messages.join(SPACE).strip
  end
end
