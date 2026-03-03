import 'package:deehelp/feature/incidents/report/widgets/success/regiter_incident_success_args.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_incident_event.freezed.dart';

@freezed
sealed class ReportIncidentEvent with _$ReportIncidentEvent {
  const factory ReportIncidentEvent.successfully(
      RegiterIncidentSuccessArgs args) = ReportSuccessfully;
  const factory ReportIncidentEvent.error(String error) = ReportError;
  const factory ReportIncidentEvent.loadProgress() = ReportLoadProgress;
}
