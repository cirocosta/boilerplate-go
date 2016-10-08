package main_test

import (
	"testing"
)

func TestDumb(t *testing.T) {
	if 1 != 1 {
		t.Error("1 can't be different from 1")
	}
}
