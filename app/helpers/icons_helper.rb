# This file is part of Mconf-Web, a web application that provides access
# to the Mconf webconferencing system. Copyright (C) 2010-2012 Mconf
#
# This file is licensed under the Affero General Public License version
# 3 or later. See the LICENSE file.

module IconsHelper

  # Default link to open the popup to join a webconference using a mobile device
  # If url is nil, renders a disabled button
  def webconf_mobile_icon_link(url)
    cls = 'webconf-join-mobile-link btn btn-small dark-gray-hover'
    unless url
      url = '#'
      cls += ' disabled login-to-enable'
    end

    link_to url, :class => cls  do
      content_tag :span, t('bigbluebutton_rails.rooms.join_mobile')
    end
  end

  # Default icon that shows a tooltip with help about something
  def icon_help(title, options={})
    icon_constructor title, "icon-awesome icon-question-sign icon-mconf-help", options
  end

  # Default icon that shows a tooltip with information about something
  def icon_info(title, options={})
    icon_constructor title, "icon-awesome icon-info-sign icon-mconf-info", options
  end

  # Default icon to a feed (rss)
  def icon_feed(options={})
    options.merge!(:alt => t('RSS'), :title => t('RSS'))
    icon_constructor t('RSS'), "icon-awesome icon-rss icon-mconf-rss", options
  end

  def icon_attachment(title, options={})
    icon_constructor title, "icon-awesome icon-paper-clip iconf-mconf-attachment", options
  end

  def icon_comment(title, options={})
    icon_constructor title, "icon-awesome icon-comment icon-mconf-comments", options
  end

  def icon_comments(title=nil, options={})
    icon_constructor title, "icon-awesome icon-comments-alt icon-mconf-comments", options
  end

  def icon_event(title=nil, options={})
    icon_constructor title, "icon-awesome icon-calendar icon-mconf-event", options
  end

  def icon_news(title="", options={})
    icon_constructor title, "icon-awesome icon-bullhorn icon-mconf-news", options
  end

  # Admin red label/icon
  # Usually shown on top of an avatar.
  def icon_superuser(options={})
    icon_constructor nil, "icon-awesome icon-cogs icon-mconf-superuser", options
  end

  # Conference "in progress" icon.
  def icon_in_progress(options={})
    icon_constructor nil, "icon-awesome icon-refresh icon-mconf-in-progress icon-spin", options
  end

  def icon_loading(options={})
    icon_constructor nil, "icon-awesome icon-refresh icon-mconf-loading icon-spin", options
  end

  def icon_spam(options={})
    icon_constructor t("spam.item"), "icon-awesome icon-warning-sign icon-mconf-spam", options
  end

  def icon_message(options={})
    if options.has_key?(:class) and options[:class].match(/active/)
      icon_constructor nil, "icon-awesome icon-envelope icon-mconf-message", options
    else
      icon_constructor nil, "icon-awesome icon-envelope-alt icon-mconf-message", options
    end
  end

  def icon_unread_message(options={})
    options[:title] ||= t("icons.unread_message")
    options[:class] = options.has_key?(:class) ? "#{options[:class]} active" : "active"
    icon_message(options)
  end

  def icon_home(options={})
    icon_constructor nil, "icon-awesome icon-home icon-mconf-home", options
  end

  def icon_logout(options={})
    icon_constructor nil, "icon-awesome icon-off icon-mconf-logout", options
  end

  def icon_profile(options={})
    icon_constructor nil, "icon-awesome icon-user icon-mconf-user", options
  end

  def icon_account(options={})
    icon_constructor nil, "icon-awesome icon-wrench icon-mconf-account", options
  end

  def icon_activity(options={})
    icon_constructor nil, "icon-awesome icon-list-alt icon-mconf-activity", options
  end

  def icon_create(options={})
    icon_constructor nil, "icon-awesome icon-plus-sign icon-mconf-create", options
  end

  def icon_delete(options={})
    icon_constructor nil, "icon-awesome icon-remove-sign icon-mconf-delete", options
  end

  def icon_confirm(options={})
    icon_constructor nil, "icon-awesome icon-ok-sign icon-mconf-confirm", options
  end

  def icon_users(options={})
    icon_constructor nil, "icon-awesome icon-user icon-mconf-users", options
  end

  def icon_edit(options={})
    icon_constructor nil, "icon-awesome icon-edit icon-mconf-edit", options
  end

  def icon_share(options={})
    icon_constructor nil, "icon-awesome icon-share icon-mconf-share", options
  end

  def icon_download(options={})
    icon_constructor nil, "icon-awesome icon-download-alt icon-mconf-download", options
  end

  def icon_attachment_new_version(options={})
    icon_constructor nil, "icon-awesome icon-plus-sign icon-mconf-attachment-new-version", options
  end

  def icon_new_tag(options={})
    icon_constructor nil, "icon-awesome icon-tags icon-mconf-new-tag", options
  end

  def icon_space_private(options={})
    icon_constructor nil, "icon-awesome icon-lock icon-mconf-space-private", options
  end

  def icon_space_public(options={})
    icon_constructor nil, "icon-awesome icon-eye-open icon-mconf-space-public", options
  end

  private

  # Base method for most of the methods above
  def icon_constructor(title=nil, cls=nil, options={})
    options[:class] = options.has_key?(:class) ? cls + " " + options[:class] : cls
    title = title.nil? ? options[:title] : title
    unless title.nil? or title.blank?
      options = options_for_tooltip(title, options)
    end
    content_tag :i, nil, options
  end

  def text_icon_constructor(title, cls=nil, text=nil, options={})
    options[:class] = options.has_key?(:class) ? cls + options[:class] : cls
    content_tag :span, text, options_for_tooltip(title, options)
  end
end
