package com.github._1c_syntax.bsl.languageserver.diagnostics;

import com.github._1c_syntax.bsl.languageserver.diagnostics.metadata.*;
import com.github._1c_syntax.bsl.parser.*;
import com.github._1c_syntax.utils.*;
import org.antlr.v4.runtime.tree.*;

import java.util.regex.*;

@DiagnosticMetadata(
  type = DiagnosticType.CODE_SMELL,
  severity = DiagnosticSeverity.MAJOR,
  minutesToFix = 1,
  tags = {
    DiagnosticTag.DESIGN
  }
)
public class BadWordsDiagnostic extends AbstractVisitorDiagnostic {

  private static final String BAD_WORDS_DEFAULT = "";

  @DiagnosticParameter(
    type = String.class,
    defaultValue = BAD_WORDS_DEFAULT
  )
  private String badWords = BAD_WORDS_DEFAULT;

  @Override
  public ParseTree visitStatement(BSLParser.StatementContext ctx){
    Pattern pattern = CaseInsensitivePattern.compile(badWords);
    Matcher matcher = pattern.matcher(ctx.getText());
    while (matcher.find()) {
      diagnosticStorage.addDiagnostic(ctx);
    }
    return super.visitStatement(ctx);
  }
}
