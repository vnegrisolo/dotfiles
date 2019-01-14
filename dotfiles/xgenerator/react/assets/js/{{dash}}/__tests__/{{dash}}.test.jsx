import React from "react"
import { shallow } from "enzyme"
import {{capital}} from "../{{dash}}.jsx"

it("renders component", () => {
  const component = shallow(<{{capital}} />)
  expect(component).toMatchSnapshot()
})
