module Reporter
  module Controllers
    module ClassMethods
      def define_report_action(report)
        define_method(report.method_name) do
          @report ||= Report.find(params[:id])
          @report_datas = report.result_data
        end
      end
    end
  end
end
ActionController::Base.send :extend, Reporter::Controllers::ClassMethods
