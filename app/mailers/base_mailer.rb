# -*- coding: utf-8 -*-
# This file is part of Mconf-Web, a web application that provides access
# to the Mconf webconferencing system. Copyright (C) 2010-2012 Mconf
#
# This file is licensed under the Affero General Public License version
# 3 or later. See the LICENSE file.

# The mailer with methods inherited by all the other mailers in the application.
class BaseMailer < ActionMailer::Base
  include Resque::Mailer
  include Mconf::LocaleControllerModule

  self.prepend_view_path(File.join(Rails.root, 'app', 'mailers', 'views'))

  protected

  # Default method to create an email object
  def create_email(to, from, subject, headers=nil)
    sender = "#{Site.current.name} <#{Site.current.smtp_sender}>"
    I18n.with_locale(locale) do
      mail(:to => to,
           :subject => "[#{Site.current.name}] #{subject}",
           :from => sender,
           :headers => headers,
           :reply_to => from) do |format|
        format.html { render layout: 'mailers' }
      end
    end
  end

  def site_locale
    current = Site.current
    if current and !current.locale.blank?
      current.locale
    else
      I18n.default_locale
    end
  end

end
