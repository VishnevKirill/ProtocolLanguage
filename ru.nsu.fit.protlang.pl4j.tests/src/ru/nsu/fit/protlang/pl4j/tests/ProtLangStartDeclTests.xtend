package ru.nsu.fit.protlang.pl4j.tests

import org.eclipse.xtext.junit4.XtextRunner
import org.junit.runner.RunWith
import org.eclipse.xtext.junit4.InjectWith
import ru.nsu.fit.protlang.pl4j.Pl4jInjectorProvider
import ru.nsu.fit.protlang.pl4j.pl4j.Protocol
import com.google.inject.Inject
import org.eclipse.xtext.junit4.util.ParseHelper
import org.junit.Test
import org.eclipse.xtext.junit4.validation.ValidationTestHelper

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(Pl4jInjectorProvider))
class ProtLangStartDeclTests {
	@Inject extension ParseHelper<Protocol>
	@Inject extension ValidationTestHelper
	
	@Test
	def void testCorrectParsing() {
		val model = '''
		Name:TestModel;
		CHARSET:"UTF-8";
		BYTEORDER:LITTLE_ENDIAN;
		Constants{
			Test;
			Test2;
		}
		'''.parse
		model.assertNoErrors
	}
	
	@Test
	def void testInverseOrder() {
		var model = '''
		Name:TestModel2;
		BYTEORDER: BIG_ENDIAN;
		CHARSET:"TestUTF";
		'''.parse
		model.assertNoErrors
	}
	
}