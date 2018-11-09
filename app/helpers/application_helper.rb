module ApplicationHelper
    def icon(shape)
        "<span class='glyphicon glyphicon-#{shape}'></span>".html_safe
    end
    # Send 'em back where they came from with a slap on the wrist
    def authority_forbidden(error)
      Authority.logger.warn(error.message)
      redirect_to request.referrer.presence || root_path, :alert => 'You are not authorized to complete that action.'
    end
end
